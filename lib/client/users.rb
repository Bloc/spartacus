module Users

  # Get all users
  #
  # @return [HTTParty::Response] All users.
  # @example Get all users
  #   Spartacus#get_users
  def get_users
    url = "#{@api_base_path}/users"
    handle_timeouts do
      self.class.get(url, headers: auth_header)
    end
  end

  # Get your own user
  #
  # @return [User] You.
  # @example Get yourself
  #   Spartacus#get_me
  def get_me
    url = "#{@api_base_path}/users/me"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      convert_response(response, "user")
    end
  end

  # Get all user
  #
  # @param id [Integer] A user id.
  # @return [User] A user.
  # @example Get a user
  #   Spartacus#get_user
  def get_user(id)
    url = "#{@api_base_path}/users/#{id}"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      convert_response(response, "user")
    end
  end

  # Get available mentors for a user
  #
  # @param id [Integer] A user id.
  # @return [User] Available mentors.
  # @example Get avaiable mentors
  #   Spartacus#get_available_mentors
  def get_available_mentors
    url = "#{@api_base_path}/users/available_mentors"
    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      convert_response(response, "user")
    end
  end

  # Get user availability
  #
  # @param id [Integer] A user id.
  # @return [HTTParty::Response] User availability.
  # @example Get user availability
  #   Spartacus#get_availability
  def get_availability(id)
    url = "#{@api_base_path}/users/#{id}/availability"
    handle_timeouts do
      self.class.get(url, headers: auth_header)
    end
  end

  # Get user enrollments
  #
  # @param id [Integer] A user id.
  # @return [HTTParty::Response] User enrollments.
  # @example Get user enrollments
  #   Spartacus#get_enrollments
  def get_enrollments(id)
    url = "#{@api_base_path}/users/#{id}/enrollments"
    handle_timeouts do
      self.class.get(url, headers: auth_header)
    end
  end

  # Get user accomplishments
  #
  # @param id [Integer] A user id.
  # @return [HTTParty::Response] User accomplishments.
  # @example Get user accomplishments
  #   Spartacus#get_accomplishments
  def get_accomplishments(id)
    url = "#{@api_base_path}/users/#{id}/accomplishments"
    handle_timeouts do
      self.class.get(url, headers: auth_header)
    end
  end

  # Mark user's current enrollment as onboarded
  #
  # @param id [Integer] A user id.
  # @return [HTTParty::Response] Succes or failure message.
  # @example Onboard user
  #   Spartacus#onboard
  def onboard(id)
    url = "#{@api_base_path}/users/#{id}/onboard"
    handle_timeouts do
      self.class.post(url, headers: auth_header)
    end
  end

  # Update the user's password
  #
  # @param id [Integer] A user id.
  # @param password [String] User password.
  # @return [User] Updated user.
  # @example Update user password
  #   Spartacus#update_password
  def update_password(id, password)
    url = "#{@api_base_path}/users/#{id}/update_password"
    handle_timeouts do
      response = self.class.put(url, headers: auth_header,
                                query: { user: { password: password,
                                                 confirmation: password } })
      convert_response(response, "user")

    end
  end

  def update_user(id, user_params={})
  end

  def update_user_data(id, user_data_params={})
  end

  def replace_availability(id, time_slots={})
  end
end
