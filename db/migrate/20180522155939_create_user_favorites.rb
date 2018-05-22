class CreateUserFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorites do |t|
    	t.integer :user_id
    	t.string :favorite_type
    	t.integer :favorite_id
    end
    add_index :user_favorites, [:favorite_type,:favorite_id]
    add_index :user_favorites, [:user_id,:favorite_type]
  end
end
