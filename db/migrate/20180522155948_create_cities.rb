class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
    	t.string :name
    	t.string :state
    	t.string :zip
    end
    add_index :cities, [:name,:state]
  end
end
