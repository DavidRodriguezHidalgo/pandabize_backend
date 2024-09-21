require 'rails_helper'

describe 'List Features values', type: :request do
  it 'list a feature value' do
    feature = create(:feature)
    feature_value = create(:feature_value, feature: feature)
    
    json = gql(query_feature_value)
    data = json['data']['featureValues'][0]

    expect(data['id']).to eq(feature_value.id.to_s)
    expect(data['value']).to eq(feature_value.value)
    expect(data['featureId']).to eq(feature.id)
  end



  private

  def query_feature_value
    <<~GQL
      {
        featureValues{
          id
          featureId
          value
        }
      }
    GQL
  end
end