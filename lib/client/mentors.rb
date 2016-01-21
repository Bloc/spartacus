module Mentors

  def mentor_students(id)
    url = "#{@api_base_path}/mentors/#{id}/students/"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      response = HTTParty::Response.new(response.request, response, response.parsed_response, { body: response["data"] })
      convert_response(response, "user")
    end
  end
end
