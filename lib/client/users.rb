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

	def post_onboard(id)
		url = "#{@api_base_path}/users/#{id}/onboard"
		handle_timeouts do
    	self.class.post(url, headers: auth_header)
    end
	end
end