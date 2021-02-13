class CreateFeatureValuesLimitValuesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :feature_values, :limit_values
  end
end
