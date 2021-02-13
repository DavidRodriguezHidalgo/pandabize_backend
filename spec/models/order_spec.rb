require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order_valid){  create(:order)  }
  let(:order_invalid_array){  build(:order, :invalid_selected_features_array)  }
  let(:order_invalid_features){  build(:order, :invalid_selected_features)  }
  let(:order_invalid_value){  build(:order, :invalid_selected_features_without_value)  }

  describe Order do
    it 'creates an order with valid params' do
      expect(order_valid).to be_valid
    end 

    it 'should not create an order if does not have an array of features' do
      expect(order_invalid_array).to_not be_valid
    end 

    it 'should not create an order with empty features' do
      expect(order_invalid_features).to_not be_valid
    end 

    it 'should not create an order with a feature without value' do
      expect(order_invalid_value).to_not be_valid
    end 
  end
end
