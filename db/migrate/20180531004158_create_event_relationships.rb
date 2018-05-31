class CreateEventRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :event_relationships do |t|
    	t.integer :event_id
    	t.integer :artist_id
    end
    add_index :event_relationships, [:event_id,:artist_id]
  end
end
