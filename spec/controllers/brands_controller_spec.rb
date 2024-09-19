require 'rails_helper'

describe BrandsController, :type => :request do
    context 'we should get all the brands' do
        let!(:brand){ create(:brand)  }
        let!(:brand_2){ create(:brand)  }

        before(:each) do
            get '/brands'
        end
        it 'returns all brands' do
            expect(JSON.parse(response.body).size).to eq(2)
        end
        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end
    end

    context 'we should get a brand' do
        let!(:brand){ create(:brand)  }

        before(:each) do
            get "/brands/#{brand.id}"
        end
        it 'returns a brand with the id' do
            expect(JSON.parse(response.body)['id']).to eq(brand.id)
        end
        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end
    end 
end