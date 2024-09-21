require 'rails_helper'

describe 'List Features', type: :request do
  it 'list a feature' do
    feature = create(:feature)
 
    json = gql(query_feature)
    data = json['data']['features'][0]

    expect(data['id']).to eq(feature.id.to_s)
    expect(data['name']).to eq(feature.name)
  end



  private

  def query_feature
    <<~GQL
      {
        features{
          id
          name
        }
      }
    GQL
  end
end