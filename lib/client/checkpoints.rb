module Checkpoints

  # Get a checkpoint
  #
  # @param id [Integer] A roadmap section id.
  # @return [HTTParty::Response] The checkpoint.
  # @example Get a checkpoint
  #   Spartacus#get_checkpoint(1, {name: 'Real Cool Checkpoint'})
  def get_checkpoint(id)
    url = "#{@api_base_path}/checkpoints/#{id}"

    handle_timeouts do
      self.class.get(url, headers: auth_header)
    end
  end

  # Update a checkpoint
  #
  # @param id [Integer] A checkpoint id.
  # @param options [Hash] A customizable set of options.
  # @option options [String] :name Checkpoint name.
  # @option options [String] :summary Checkpoint summary.
  # @option options [String] :body Checkpoint body.
  # @option options [String] :assignment Checkpoint assignment.
  # @option options [Integer] :points Checkpoint point.
  # @option options [String] :body_and_assignment Checkpoint body and Assignment
  # @return [HTTParty::Response] The updated checkpoint
  # @example Update a checkpoint
  #   Spartacus#update_checkpoint(129, {name: 'Real Cool Checkpoint'})
  def update_checkpoint(id, options={})
    whitelist = ['name', 'summary', 'body', 'assignment', 'points', 'body_and_assignment']

    options = convert_keys(options)
    checkpoint_params = whitelist_params(options, whitelist)
    url = "#{@api_base_path}/checkpoints/#{id}"

    handle_timeouts do
      self.class.put(url,
                     headers: auth_header,
                     query: { checkpoint: checkpoint_params })
    end
  end

  # Delete a checkpoint
  #
  # @param id [Integer] A checkpoint id.
  # @return [HTTParty::Response] The checkpoint.
  # @example Delete a checkpoint
  #   Spartacus#delete_checkpoint(1, {name: 'Real Cool Checkpoint'})
  def delete_checkpoint(id)
    url = "#{@api_base_path}/checkpoints/#{id}"

    handle_timeouts do
      self.class.delete(url, headers: auth_header)
    end
  end
end