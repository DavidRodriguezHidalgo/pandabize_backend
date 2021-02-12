class CreateFeatureValues < ActiveRecord::Migration[6.0]
  def change
    create_table :feature_values do |t|
      t.string :value
      t.references :feature
      t.timestamps
    end
  end
end
