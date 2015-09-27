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

  def convert_keys(options)
    options.keys.each {|k| options[k.to_s] = options.delete(k) if k.kind_of?(Symbol)}
    options
  end

  def whitelist_params(options, whitelist)
    options.select {|k, v| whitelist.include?(k)}
  end
end