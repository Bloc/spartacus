require_relative 'base_client'

module Users
  include BaseClient

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
                                body: { user: { password: password,
                                                 confirmation: password } })
      convert_response(response, "user")

    end
  end

  # Update a user
  #
  # @param id [Integer] A user id.
  # @param options [Hash] A customizable set of options.
  # @option options [String] :email User email.
  # @option options [String] :first_name User first_name.
  # @option options [String] :last_name User last name.
  # @option options [String] :twitter_handle User Twitter handle.
  # @option options [String] :dribbble_handle User Dribbble handle.
  # @option options [String] :github_handle User GitHub handle.
  # @option options [String] :codecademy_handle User Codecademy handle.
  # @option options [String] :linkedin User LinkIn profile.
  # @option options [String] :time_zone User time zone
  # @option options [String] :bio User biography.
  # @option options [String] :name User fullname.
  # @option options [String] :photo User photo.
  # @option options [String] :os User operating system.
  # @option options [Boolean] :dismissed_holiday_freeze User dismissed
  #                                                     holiday freeze.
  # @option options [String] :title User title.
  # @option options [String] :lead_mentor_account User lead mentor account.
  # @option options [String] :password User password.
  # @option options [String] :password_confirmation User password confirmation.
  # @option options [Boolean] :remember_me Remeber user.
  # @option options [String] :facebook_id User Facebook ID.
  # @option options [String] :stripe_customer_id User Stripe customer ID.
  # @option options [String] :stripe_token User Stripe token.
  # @option options [String] :skype_handle User Skype handle.
  # @option options [String] :referral_token User referral token.
  # @option options [Boolean] :send_new_message_emails Send user new emails.
  # @option options [String] :referred_by_id User referred by ID.
  # @option options [String] :google_plus_id User GooglePlus ID.
  # @option options [Boolean] :private_profile Set user profile to private.
  # @option options [Integer] :quota User student quota.
  # @option options [Integer] :quota_limit User student quota limit.
  # @option options [Integer] :first_visit_id User first visit ID.
  # @option options [Integer] :crm_lead_id User CRM lead ID.
  # @option options [String] :phone_num User phone number.
  # @option options [String] :role User role.
  # @option options [Integer] :student_profile User student profile.
  # @option options [String] :tos
  # @return [User] The updated user.
  # @example Update a user's data
  #   Spartacus#update_user_data(129, {how_heard: 'On the Googles'})
  def update_user(id, options={})
    whitelist = ['email','first_name','last_name','twitter_handle',
                 'dribbble_handle','github_handle','codecademy_handle',
                 'linkedin','time_zone','bio','name','photo','os',
                 'dismissed_holiday_freeze','title','lead_mentor_account',
                 'password','password_confirmation','remember_me','facebook_id',
                 'stripe_customer_id','stripe_token','skype_handle',
                 'referral_token','send_new_message_emails','referred_by_id',
                 'google_plus_id','private_profile','quota','quota_limit',
                 'first_visit_id','crm_lead_id','phone_num','role',
                 'student_profile','tos']

    options = convert_keys(options)
    user_params = whitelist_params(options, whitelist)
    url = "#{@api_base_path}/users/#{id}"

    handle_timeouts do
      response = self.class.put(url, headers: auth_header,
                                body: { user: user_params })
      convert_response(response, "User")
    end
  end

  # # Update a user's data
  # #
  # # @param id [Integer] A user id.
  # # @param options [Hash] A customizable set of options.
  # # @option options [String] :how_heard How user heard about Bloc.
  # # @option options [String] :how_heard_details How user heard about Bloc details.
  # # @option options [String] :how_paid How user paid for Bloc.
  # # @option options [String] :how_paid_details How user paid for Bloc details.
  # # @return [UserData] The updated user data.
  # # @example Update a user's data
  # #   Spartacus#update_user_data(129, {how_heard: 'On the Googles'})
  # def update_user_data(id, options={})
  #   whitelist = ['how_heard', 'how_heard_details', 'how_paid', 'how_paid_details']
  #
  #   options = convert_keys(options)
  #   user_data_params = whitelist_params(options, whitelist)
  #   url = "#{@api_base_path}/users/#{id}/update_user_data"
  #
  #   handle_timeouts do
  #     response = self.class.put(url, headers: auth_header,
  #                               body: { user_data: user_data_params })
  #     convert_response(response, "UserData")
  #   end
  # end

  # def replace_availability(id, time_slots={})
  # end
end
