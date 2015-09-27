require 'httparty'
require_relative 'client/checkpoints'
require_relative 'client/users'

class Spartacus
  include HTTParty
  include Checkpoints
  include Users

  def initialize(api_jwt, api_base_path="https://www.bloc.io/api/v1")
    @api_jwt = api_jwt
    @api_base_path = api_base_path 
  end

  # Handle API timouts
  def handle_timeouts
    begin
      yield
    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end

  private

  # Set the API Authorization Header
  #
  # @return [Hash] The authorization header
  def auth_header
    { "authorization" => @api_jwt }
  end
end