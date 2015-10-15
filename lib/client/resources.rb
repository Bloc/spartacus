require_relative 'base_client'

module Resources
  include BaseClient

  # Create a resource
  #
  # @param options [Hash] A customizable set of options.
  # @param name [String] Resource name.
  # @param content [String] Resource content.
  # @param is_public [Boolean] Resource privacy.
  # @return [Resource] The created resource
  # @example Create a checkpoint
  #   Spartacus#create_resource('Real Cool Resource', 'My content')
  def create_resource(name=nil, content=nil, is_public=false)
    url = "#{@api_base_path}/resources/"

    handle_timeouts do
      response = self.class.post(url, headers: auth_header,
                                body: { resource: {
                                  name: name, content: content, is_public: is_public } })
      convert_response(response, "resource")
    end
  end

  # Update a resource
  #
  # @param id [Integer] A resource id.
  # @param options [Hash] A customizable set of options.
  # @option options [String] :name Resource name.
  # @option options [String] :content Resource content.
  # @option options [Boolean] :is_public Resource privacy.
  # @return [Resource] The updated resource
  # @example Update a checkpoint
  #   Spartacus#update_resource(129, {name: 'Real Cool Resource'})
  def update_resource(id, options={})
    whitelist = ['name', 'content', 'is_public']

    options = convert_keys(options)
    resource_params = whitelist_params(options, whitelist)
    url = "#{@api_base_path}/resources/#{id}"

    handle_timeouts do
      response = self.class.put(url, headers: auth_header,
                                body: { resource: resource_params })
      convert_response(response, "resource")
    end
  end

  # Add a tag to a resource
  #
  # @param id [Integer] A resource id.
  # @param id [String] The tag to add.
  # @return [Array] The resource's tags.
  # @example Add a tag to a resource
  #   Spartacus#add_tag_to_resource(129, 'android')
  def add_tag_to_resource(id, tag)
    tag.gsub!(" ", "_")
    url = "#{@api_base_path}/resources/#{id}/tags"

    handle_timeouts do
      response = self.class.post(url, headers: auth_header,
                                body: { add: tag })
      JSON.parse(response.body)['new_list']
    end
  end

  # Remove a tag from a resource
  #
  # @param id [Integer] A resource id.
  # @param id [String] The tag to remove.
  # @return [Array] The resource's tags.
  # @example Remove a tag from a resource
  #   Spartacus#remove_tag_from_resource(129, 'android')
  def remove_tag_from_resource(id, tag)
    tag.gsub!(" ", "_")
    url = "#{@api_base_path}/resources/#{id}/tags"

    handle_timeouts do
      response = self.class.post(url, headers: auth_header,
                                body: { remove: tag })
      JSON.parse(response.body)['new_list']
    end
  end
end
