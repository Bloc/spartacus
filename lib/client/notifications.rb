module Notifications

  def user_notications(student_id=nil)
    url = "#{@api_base_path}/notifications/"
    handle_timeouts do
      response = self.class.get(url)
      convert_response(response, "notification")
    end
  end
end
