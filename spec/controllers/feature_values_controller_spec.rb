require 'rails_helper'

RSpec.describe FeatureValuesController, type: :request do
    context 'we should get all the feature values' do
        let!(:brand){	create(:brand)	}
        let!(:feature1){	create(:feature)	}
        let!(:feature_value1){  create(:feature_value)  }
        let!(:feature_value2){  create(:feature_value)  }
        let!(:feature_value3){  create(:feature_value)  }

        before(:each) do
            get '/feature_values'
        end
        it 'returns all feature values' do
            expect(JSON.parse(response.body).size).to eq(3)
        end
        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end
    end 
end
