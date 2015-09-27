require 'httparty'

Dir[File.dirname(__FILE__) + '/client/*.rb'].each {|file| require file }

class Spartacus
  include HTTParty
  include Checkpoints
  include Users
  include RoadmapSections

  def initialize(api_jwt, api_base_path="https://www.bloc.io/api/v1")
    @api_jwt = api_jwt
    @api_base_path = api_base_path
  end
end
