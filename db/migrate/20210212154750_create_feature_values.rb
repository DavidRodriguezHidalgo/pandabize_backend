class CreateFeatureValues < ActiveRecord::Migration[7.2]
  def change
    create_table :feature_values do |t|
      t.string :value
      t.references :feature

      t.timestamps
    end
  end
end
