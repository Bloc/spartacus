require 'json'
require 'active_support/inflector'

module ClassFactory
  def ClassFactory.build_response_object(json_string, name)
    response_hash = JSON.parse(json_string)
    checkpoint = ClassFactory::GenericClass.new
    checkpoint.create_class name
    name.camelize.constantize.new(response_hash)
  end

  class GenericClass
    def create_class name
      Object.const_set(name.classify,
      Class.new do
        def initialize(hash)
          hash.each do |k,v|
            self.instance_variable_set("@#{k}", v)
            self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})
            self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})
          end
        end
      end
      )
    end
  end
end
