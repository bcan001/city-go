class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
    	t.string :feature_type # event, venue
    	t.integer :feature_id
    end
    add_index :features, [:feature_type,:feature_id]
  end
end
