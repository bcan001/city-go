class CreateUserRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rsvps do |t|
    	t.integer :user_id
    	t.integer :event_id
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    end
    add_index :user_rsvps, [:user_id,:event_id]
    add_index :user_rsvps, :event_id
  end
end
