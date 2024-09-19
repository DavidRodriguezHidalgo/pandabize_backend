require 'rails_helper'

RSpec.describe FeaturesController, type: :request do
    context 'we should get all the features' do
        let!(:brand){ create(:brand)  }
        let!(:feature1){  create(:feature)  }
        let!(:feature2){  create(:feature)  }

        before(:each) do
            get '/features'
        end
        it 'returns all features' do
            expect(JSON.parse(response.body).size).to eq(2)
        end
        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end
    end 
end