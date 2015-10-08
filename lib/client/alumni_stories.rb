require_relative 'base_client'

module AlumniStories
  include BaseClient

  # Create a checkpoint
  #
  # @param id [Integer] An alumni story id.
  # @param direction [String] The direction to move to the alumni story.
  # @return [AlumniStory] The updated alumni story
  # @example Update an alumni story sort order
  #   Spartacus#update_alum_story_sort_order(1, {name: 'Real Cool Checkpoint'})
  def update_alum_story_sort_order(id, direction='down')
    accepted_params = ['up', 'down', :up, :down]
    if accepted_params.include?(direction)

      url = "#{@api_base_path}/alum_stories/#{id}/update_sort_order"

      handle_timeouts do
        response = self.class.put(url,
                                   headers: auth_header,
                                   body: { direction: direction })
        convert_response(response, "alumni_story")
      end
    else
      raise InvalidDirectionError
    end
  end
end
