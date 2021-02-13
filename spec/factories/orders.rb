FactoryBot.define do
  factory :order do
    amount { 10.0 }
    items { 
      [
        {
          product: 'test product',
          quantity: 1,
          price: 17.50, 
          selected_features: [
            {feature: 'wheel size',  feature_value: '17'},
            {feature: 'color', feature_value: 'yellow'}
          ]
        }
      ]
    }
    trait :invalid_product_quantity do
      items { 
        [
          {
            product_id: 1, 
            price: 17.50, 
            selected_features: [
              {feature: 'wheel size' }
            ]
          }
        ]
      }
    end
    trait :invalid_product_price do
      items { 
        [
          {
            product_id: 1, 
            quantity: 1,
            selected_features: [
              {feature: 'wheel size' }
            ]
          }
        ]
      }
    end
    trait :invalid_selected_features_array do
      items { 
        [
          {
            product: 'test product', 
            quantity: 1,
            price: 17.50,
            selected_features: {}
          }
        ]
      }
    end
    trait :invalid_selected_features do
      items { 
        [
          {
            product: 'test product',
            quantity: 1,
            price: 17.50,  
            selected_features: []
          }
        ]
      }
    end
    trait :invalid_selected_features_without_value do
      items { 
        [
          {
            product_id: 1,
            quantity: 1,
            price: 17.50,  
            selected_features: [
              {feature: 'wheel size' }
            ]
          }
        ]
      }
    end
  
  end
end
