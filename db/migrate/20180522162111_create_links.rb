class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
    	t.integer :artist_id
    	t.string :link_type
    	t.integer :link_id
    end
    add_index :links, [:link_type,:link_id]
    add_index :links, [:artist_id,:link_type]
  end
end
