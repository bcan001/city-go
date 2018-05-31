class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.datetime :event_date
    	t.string :title
    	t.text :description
    	t.integer :city_id
    	t.integer :venue_id
    end
    add_index :events, [:event_date,:city_id]
    add_index :events, :venue_id
  end
end
