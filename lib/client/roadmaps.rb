require_relative 'base_client'

module Roadmaps
  include BaseClient

  # Get a roadmap
  #
  # @param id [Integer] A roadmap id.
  # @return [Roadmap] The roadmap.
  # @example Get a roadmap
  #   Spartacus#get_roadmap(1)
  def get_roadmap(id)
    url = "#{@api_base_path}/roadmaps/#{id}"

    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      convert_response(response, "roadmap")
    end
  end

  # Get a roadmap's sections
  #
  # @param id [Integer] A roadmap id.
  # @return [HTTParty::Response] The roadmap's sections.
  # @example Get a roadmap's sections
  #   Spartacus#get_roadmap(1)
  def get_sections_for_roadmap(id)
    url = "#{@api_base_path}/roadmaps/#{id}/sections"

    handle_timeouts do
      self.class.get(url, headers: auth_header)
    end
  end

  # Update a roadmap
  #
  # @param id [Integer] A roadmap id.
  # @param options [Hash] A customizable set of options.
  # @option options [String] :name Roadmap name.
  # @option options [String] :display_name Roadmap display.
  # @option options [Integer] :version Roadmap version.
  # @option options [Integer] :projects Number of roadmap projects
  # @return [Roadmap] The updated roadmap
  # @example Update a roadmap
  #   Spartacus#update_roadmap(129, {name: 'Real Cool Roadmap'})
  def update_roadmap(id, options={})
    whitelist = ['name', 'display_name', 'version', 'projects']

    options = convert_keys(options)
    roadmap_params = whitelist_params(options, whitelist)
    url = "#{@api_base_path}/roadmaps/#{id}"

    handle_timeouts do
      response = self.class.put(url, headers: auth_header,
                                body: { roadmap: roadmap_params })
      convert_response(response, "roadmap")
    end
  end
end
