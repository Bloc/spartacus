module CourseSubjects

  # Create a course subject
  #
  # @param name [String] Name of the subject.
  # @param display_name [String] User friendly name of the subject.
  # @param occupation_name [String] Name of a person who has this job.
  # @param options [Hash] A customizable set of options.
  # @option options [Array] :default_goal_options Default goal options.
  # @option options [Integer] :director_id Id of the course director.
  # @option options [String] :director_slug User friendly director name.
  # @return [CourseSubject] The created course subject
  # @example Create a course subject
  #   Spartacus#create_course_subject()
  def create_course_subject(name, display_name, occupation_name, options={})
    whitelist = ['default_goal_options', 'director_id', 'director_slug']

    options = convert_keys(options)
    course_subject_params = whitelist_params(options, whitelist)
    course_subject_params.merge!({ name: name, display_name: display_name, occupation_name: occupation_name })
    url = "#{@api_base_path}/course_subjects"

    handle_timeouts do
      response = self.class.post(url,
                                 headers: auth_header,
                                 body: { course_subject: course_subject_params })
      convert_response(response, "course_subject")
    end
  end

  # Update a course subject
  #
  # @param id [Integer] A course subject id.
  # @param options [Hash] A customizable set of options.
  # @option options [String] :name Name of the subject.
  # @option options [String] :display_name User friendly name of the subject.
  # @option options [String] :occupation_name Name of a person who has this job.
  # @option options [Array] :default_goal_options Default goal options.
  # @option options [Integer] :director_id Id of the course director.
  # @option options [String] :director_slug User friendly director name.
  # @return [CourseSubject] The updated course subject
  # @example Update a course subject
  #   Spartacus#update_course_subject()
  def update_course_subject(id, options={})
    whitelist = ['name', 'display_name', 'occupation_name', 'default_goal_options', 'director_id', 'director_slug']

    options = convert_keys(options)
    course_subject_params = whitelist_params(options, whitelist)
    url = "#{@api_base_path}/course_subjects/#{id}"

    handle_timeouts do
      response = self.class.put(url,
                                 headers: auth_header,
                                 body: { course_subject: course_subject_params })
      convert_response(response, "course_subject")
    end
  end
end
