require 'spec_helper'

describe Checkpoints do
  before do
    @client = Spartacus.new(ENV['BLOCUSER'], ENV['BLOCPASS'], 'http://localhost:3000/api/v1')
  end

  describe '#get_checkpoint' do
    it 'returns a Checkpoint object' do
      VCR.use_cassette 'checkpoints', record: :new_episodes do
        response = @client.get_checkpoint(1)
        expect(response).to be_an_instance_of(Checkpoint)
      end
    end

    it 'returns an error message for a missing checkpoint' do
      VCR.use_cassette 'checkpoints', record: :new_episodes do
        response = @client.get_checkpoint(-1)
        expect(response.message).to eq('Not Found')
        expect(response.code).to eq(404)
      end
    end
  end

  describe '#update_checkpoint' do
    it 'returns a Checkpoint object' do
      VCR.use_cassette 'checkpoints', record: :new_episodes do
        response = @client.update_checkpoint(2, {name: 'My Checkpoint'})
        expect(response).to be_an_instance_of(Checkpoint)
        expect(response.name).to eq('My Checkpoint')
      end
    end

    it 'updates checkpoint attributes' do
      VCR.use_cassette 'checkpoints', record: :new_episodes do
        attributes = {
          name: "My Checkpoint",
          summary: "Great Summary",
          body: "Really great checkpoint",
          assignment: "Do the work well",
          points: 5
        }

        response = @client.update_checkpoint(3, attributes)
        expect(response.name).to eq(attributes['name'])
        expect(response.summary).to eq(attributes['summary'])
        expect(response.body).to eq(attributes['body'])
        expect(response.assignment).to eq(attributes['assignment'])
        expect(response.points).to eq(attributes['points'])
      end
    end

    it 'returns an error message for a messing checkpoint' do
      VCR.use_cassette 'checkpoints', record: :new_episodes do
        response = @client.update_checkpoint(-1, {name: 'My Checkpoint'})
        expect(response.message).to eq('Not Found')
        expect(response.code).to eq(404)
      end
    end
  end
end
