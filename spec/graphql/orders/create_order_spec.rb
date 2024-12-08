require 'rails_helper'

describe 'Create an order', type: :request do
  it 'creates an order' do
    brand = create(:brand)
    feature = create(:feature)
    feature_value = create(:feature_value, feature: feature)

    json = gql(query_order(brand.id, 1, feature.id, feature_value.id))
    data = json['data']['createOrder']

    expect(data['amount']).to eq(brand.price)
    expect(data['items'].size).to eq(1)
    expect(data['items'][0]['productId']).to eq(brand.id.to_s)
    expect(data['items'][0]['quantity']).to eq(1)
    expect(data['items'][0]['selectedFeatures'][0]['feature']).to eq(feature.name)
    expect(data['items'][0]['selectedFeatures'][0]['featureValue']).to eq(feature_value.value)
  end



  private

  def query_order(product_id, quantity, feature, feature_value)
    <<~GQL
      mutation {
        createOrder(
          items: [{productId: #{product_id}, quantity: #{quantity}, selectedFeatures: [{featureId: "#{feature}", featureValueId: "#{feature_value}"}]}]
        ){
          items{
            productId
            quantity
            selectedFeatures{
              feature
              featureValue
            }
          }
        }
      }
    GQL
  end
end