class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
    	t.string :name
    	t.text :description
    end
    add_index :artists, :name
  end
end
