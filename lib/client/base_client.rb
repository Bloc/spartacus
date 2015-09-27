require_relative 'class_factory'

module BaseClient
  # Handle API timouts
  def handle_timeouts
    begin
      yield
    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end

  # This needs a better name
  def convert_response(response, name)
    if success?(response.code)
     ClassFactory.build_response_object(response.body, name)
    else
     return response
    end
  end

  def success?(code)
    code.between?(200, 299)
  end

  # Set the API Authorization Header
  #
  # @return [Hash] The authorization header
  def auth_header
    { "authorization" => @api_jwt }
  end

  def convert_keys(options)
    options.keys.each {|k| options[k.to_s] = options.delete(k) if k.kind_of?(Symbol)}
    options
  end

  def whitelist_params(options, whitelist)
    options.select {|k, v| whitelist.include?(k)}
  end
end
