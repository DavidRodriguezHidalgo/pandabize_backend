require 'rails_helper'

describe 'List Brands', type: :request do
  it 'list brands' do
    brand = create(:brand)
    
    json = gql(query_brands)
    data = json['data']['brands'][0]

    expect(data['id']).to eq(brand.id.to_s)
    expect(data['name']).to eq(brand.name)
    expect(data['price']).to eq(brand.price)
  end

  it 'shows a brand' do
    brand = create(:brand)
    
    json = gql(query_a_brand(brand.id))
    data = json['data']['brand']

    expect(data['id']).to eq(brand.id.to_s)
    expect(data['name']).to eq(brand.name)
    expect(data['price']).to eq(brand.price)
  end



  private

  def query_brands
    <<~GQL
      {
        brands {
          id
          name
          price
        }
      }
    GQL
  end

  def query_a_brand(brand_id)
    <<~GQL
      {
        brand(id: #{brand_id}) {
          id
          name
          price
        }
      }
    GQL
  end
end