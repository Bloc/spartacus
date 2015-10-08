require 'httparty'
require 'json'

require_relative 'client/alumni_stories'
require_relative 'client/checkpoints'
require_relative 'client/course_subjects'
require_relative 'client/roadmap_sections'
require_relative 'client/users'

Dir[File.dirname(__FILE__) + '/client/*.rb'].each {|file| require file }

class Spartacus
  include HTTParty
  include Checkpoints
  include Users
  include RoadmapSections
  include AlumniStories
  include CourseSubjects

  def initialize(email, password, api_base_path="https://www.bloc.io/api/v1")
    @api_base_path = api_base_path
    url = "#{@api_base_path}/sessions"

    response = self.class.post(url, body: { email: email, password: password })

    if success?(response.code)
      response_hash = JSON.parse(response.body)
      @auth_token =  response_hash["auth_token"]
    else
      raise response.body
    end
  end
end
