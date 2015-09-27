require 'httparty'
require 'json'

Dir[File.dirname(__FILE__) + '/client/*.rb'].each {|file| require file }

class Spartacus
  include HTTParty
  include Checkpoints
  include Users
  include RoadmapSections

  def initialize(email, password, api_base_path="https://www.bloc.io/api/v1")
    @api_base_path = api_base_path
    url = "#{@api_base_path}/sessions"

    response = self.class.post(url, query: { email: email, password: password } )

    if success?(response.code)
      response_hash = JSON.parse(response.body)
      @auth_token =  response_hash["auth_token"]
    else
      raise response.body
    end
  end
end
