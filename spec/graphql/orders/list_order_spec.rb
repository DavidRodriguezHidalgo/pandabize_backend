require 'rails_helper'

describe 'List order', type: :request do
  it 'list an order' do
    order = create(:order)

    json = gql(query_order)
    data = json['data']['orders'][0]

    expect(data['amount']).to eq(order.amount)
    expect(data['items'].size).to eq(1)
    expect(data['items'][0]['productId']).to eq(order['items'][0]['product_id'].to_s)
    expect(data['items'][0]['quantity']).to eq(1)
    expect(data['items'][0]['selectedFeatures'][0]['feature']).to eq(order['items'][0]['selected_features'][0]['feature'])
    expect(data['items'][0]['selectedFeatures'][0]['featureValue']).to eq(order['items'][0]['selected_features'][0]['feature_value'])
  end



  private

  def query_order
    <<~GQL
      {
        orders{
          id
          amount
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