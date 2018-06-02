class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
    	t.string :owner_type # Artist / Venue
    	t.integer :owner_id 
    	t.string :link_type
    	t.string :url
    end
    add_index :links, [:owner_type,:owner_id]
    add_index :links, [:owner_id,:link_type]
    add_index :links, :link_type
  end
end
