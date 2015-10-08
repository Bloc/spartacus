require 'spec_helper'

describe RoadmapSections do
  before do
    @client = Spartacus.new(ENV['BLOCUSER'], ENV['BLOCPASS'], 'http://localhost:3000/api/v1')
  end

  describe '#create_checkpoint' do
    it 'returns a Checkpoint object' do
      VCR.use_cassette 'roadmap_sections', record: :new_episodes do
        response = @client.create_checkpoint(1, {name: 'My Checkpoint'})
        expect(response).to be_an_instance_of(Checkpoint)
        expect(response.name).to eq('My Checkpoint')
      end
    end

    it 'returns an Checkpoint object' do
      VCR.use_cassette 'roadmap_sections', record: :new_episodes do
        attributes = {
          name: "My Checkpoint",
          summary: "Great Summary",
          body: "Really great checkpoint",
          assignment: "Do the work well",
          points: 5
        }

        response = @client.create_checkpoint(2, attributes)
        expect(response.name).to eq(attributes['name'])
        expect(response.summary).to eq(attributes['summary'])
        expect(response.body).to eq(attributes['body'])
        expect(response.assignment).to eq(attributes['assignment'])
        expect(response.points).to eq(attributes['points'])
      end
    end

    it 'returns an error message for a missing roadmap section' do
      VCR.use_cassette 'roadmap_sections', record: :new_episodes do
        response = @client.create_checkpoint(-1)
        expect(response.message).to eq('Not Found')
        expect(response.code).to eq(404)
      end
    end
  end
end
