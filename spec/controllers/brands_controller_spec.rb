require 'rails_helper'

describe BrandsController, :type => :request do
    context 'we should get all the brands in stock' do
        let!(:brand){	create(:brand)	}
        let!(:brand_2){	create(:brand)	}

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

    context 'we should not get the brands with no stock' do
        let!(:brand){	create(:brand)	}
        let!(:brand_2){	create(:brand, :no_stock)	}

        before(:each) do
            get '/brands'
        end

        it 'returns all brands' do
            expect(JSON.parse(response.body).size).to eq(1)
        end
        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end
    end 
end