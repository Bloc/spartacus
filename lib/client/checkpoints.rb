require_relative 'base_client'

module Checkpoints
  include BaseClient
  # Get a checkpoint
  #
  # @param id [Integer] A roadmap section id.
  # @return [Checkpoint] The checkpoint.
  # @example Get a checkpoint
  #   Spartacus#get_checkpoint(1, {name: 'Real Cool Checkpoint'})
  def get_checkpoint(id)
    url = "#{@api_base_path}/checkpoints/#{id}"

    handle_timeouts do
      response = self.class.get(url, headers: auth_header)
      convert_response(response, "checkpoint")
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
  # @option options [String] :assignment Checkpoint body and assignment.
  # @option options [Integer] :points Checkpoint point.
  # @option options [String] :body_and_assignment Checkpoint body and Assignment
  # @return [Checkpoint] The updated checkpoint
  # @example Update a checkpoint
  #   Spartacus#update_checkpoint(129, {name: 'Real Cool Checkpoint'})
  def update_checkpoint(id, options={})
    whitelist = ['name', 'summary', 'body', 'assignment','body_and_assignment', 'points']

    options = convert_keys(options)
    checkpoint_params = whitelist_params(options, whitelist)
    url = "#{@api_base_path}/checkpoints/#{id}"

    handle_timeouts do
      response = self.class.put(url, headers: auth_header,
                                body: { checkpoint: checkpoint_params })
      convert_response(response, "checkpoint")
    end
  end

  # Delete a checkpoint
  #
  # @param id [Integer] A checkpoint id.
  # @return [Checkpoint] The deleted checkpoint.
  # @example Delete a checkpoint
  #   Spartacus#delete_checkpoint(1, {name: 'Real Cool Checkpoint'})
  def delete_checkpoint(id)
    url = "#{@api_base_path}/checkpoints/#{id}"

    handle_timeouts do
      response = self.class.delete(url, headers: auth_header)
      convert_response(response, "checkpoint")
    end
  end
end
