require 'spec_helper'

describe AlumniStories do
  before do
    stub_request(:any, "http://localhost:3000")
    @client = Spartacus.new(ENV['BLOCUSER'], ENV['BLOCPASS'])
  end

  describe '#update_alum_story_sort_order' do
    it 'returns an AlumniStory object' do
      VCR.use_cassette 'alumni_stories', record: :new_episodes do
        response = @client.update_alum_story_sort_order(2)
        expect(response).to be_an_instance_of(AlumniStory)
      end
    end

    it 'returns an error message for a missing alumni story' do
      VCR.use_cassette 'checkpoints', record: :new_episodes do
        response = @client.get_checkpoint(-1)
        expect(response.message).to eq('Not Found')
        expect(response.code).to eq(404)
      end
    end
  end
end
