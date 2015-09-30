require 'httparty'
require 'json'

require_relative './client/alumni_stories'
require_relative './client/checkpoints'
require_relative './client/roadmap_sections'
require_relative './client/users'

class Spartacus
  include HTTParty
  include Checkpoints
  include Users
  include RoadmapSections
  include AlumniStories

  def initialize(email, password, api_base_path="https://www.bloc.io/api/v1")
    @api_base_path = api_base_path
    url = "#{@api_base_path}/sessions"

    response = self.class.post(url, query: { email: email, password: password })

    if success?(response.code)
      response_hash = JSON.parse(response.body)
      @auth_token =  response_hash["auth_token"]
    else
      raise response.body
    end
  end
end
