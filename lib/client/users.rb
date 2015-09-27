module Users
	def get_users
		url = "#{@api_base_path}/users"
		handle_timeouts do
    	self.class.get(url, headers: auth_header)
    end
	end

	def get_me
		url = "#{@api_base_path}/users/me"
		handle_timeouts do
    	self.class.get(url, headers: auth_header)
    end
	end

	def get_user(id)
		url = "#{@api_base_path}/users/#{id}"
		handle_timeouts do
    	self.class.get(url, headers: auth_header)
    end
	end

	def get_available_mentors
		url = "#{@api_base_path}/users/available_mentors"
		handle_timeouts do
    	self.class.get(url, headers: auth_header)
    end
	end

	def get_availability(id)
		url = "#{@api_base_path}/users/#{id}/availability"
		handle_timeouts do
    	self.class.get(url, headers: auth_header)
    end
	end

	def get_enrollments(id)
		url = "#{@api_base_path}/users/#{id}/enrollments"
		handle_timeouts do
    	self.class.get(url, headers: auth_header)
    end
	end

	def get_accomplishments(id)
		url = "#{@api_base_path}/users/#{id}/accomplishments"
		handle_timeouts do
    	self.class.get(url, headers: auth_header)
    end
	end

	def onboard(id)
		url = "#{@api_base_path}/users/#{id}/onboard"
		handle_timeouts do
    	self.class.post(url, headers: auth_header)
    end
	end

	def update_password(id, password)
		url = "#{@api_base_path}/users/#{id}/update_password"
		handle_timeouts do
    	self.class.put(url, headers: auth_header,
    		             query: { user: { password: password, confirmation: password } })
    end
	end

	def update_user(id, user_params={})
	end

	def update_user_data(id, user_data_params={})
	end

	def replace_availability(id, time_slots={})
	end
end