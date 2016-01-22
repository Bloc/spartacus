module Mentors
  def mentors
    url = "#{@api_base_path}/mentors/"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      convert_response(response, "user")
    end
  end

  def mentor_paychecks(id)
    url = "#{@api_base_path}/mentors/#{id}/paychecks/"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      convert_response(response, "paychecks")
    end
  end

  def mentor_assssments(id)
    url = "#{@api_base_path}/mentors/#{id}/assessments/"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      convert_response(response, "assessments")
    end
  end

  def mark_mentor_assessment_read(id, assessment_id)
    url = "#{@api_base_path}/mentors/#{id}/mark_assessment_read/"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header, assessment_id: assessment_id)
      convert_response(response, "assessments")
    end
  end

  def mentor_students(id)
    url = "#{@api_base_path}/mentors/#{id}/students/"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      response = HTTParty::Response.new(response.request, response, response.parsed_response, { body: response["data"] })

      convert_response(response, "user")
    end
  end
end
