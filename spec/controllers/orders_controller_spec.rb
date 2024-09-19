require 'rails_helper'

RSpec.describe OrdersController, type: :request do
    context 'we should get all the orders' do
        let!(:order1){  create(:order)  }
        let!(:order2){  create(:order)  }

        before(:each) do
            get '/orders'
        end
        it 'returns all orders' do
            expect(JSON.parse(response.body).size).to eq(2)
        end
        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end
    end
    
    context 'we should be able to create an order' do
        let(:brand) {create(:brand)}
        let(:feature) {create(:feature)}
        let(:feature_value) {create(:feature_value, feature: feature)}
        before do
            payload = {
                order: {
                    items: [
                        {
                            product_id: brand.id,
                            quantity: 2,
                            selected_features: [
                                {
                                    feature: feature.name,
                                    feature_value: feature_value.value
                                }
                            ]
                        }
                    ]
                }
            }
            @first_item = payload[:order][:items].first
            post '/orders', as: :json, params: payload
        end

        it 'returns the amount' do
            expect(JSON.parse(response.body)['amount']).to eq(@first_item[:quantity].to_i * brand.price)
        end

        it 'returns the product' do
            expect(JSON.parse(response.body)['items'].first['product_id']).to eq(brand.id)
        end

        it 'returns the price' do
            expect(JSON.parse(response.body)['items'].first['price']).to eq(@first_item[:price])
        end

        it 'returns the selected features' do
            expect(JSON.parse(response.body)['items'].first['selected_features'].first['feature']).to eq(@first_item[:selected_features].first[:feature])
            expect(JSON.parse(response.body)['items'].first['selected_features'].first['feature_value']).to eq(@first_item[:selected_features].first[:feature_value])
        end

        it 'returns a created status' do
            expect(response).to have_http_status(:ok)
        end
    end
end