require_relative '../lib/spartacus'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'cassettes'
  c.hook_into :webmock
  c.ignore_request do |request|
    URI(request.uri).request_uri == '/api/v1/sessions'
  end

  c.before_record do |i|
    i.response.headers.delete('Set-Cookie')
    i.request.headers.delete('Authorization')
  end
end
