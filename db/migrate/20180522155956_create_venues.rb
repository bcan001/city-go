class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
    	t.string :name
    	t.text :description
    	t.integer :city_id
    	t.string :address
    end
    add_index :venues, :name
    add_index :venues, :city_id
  end
end
