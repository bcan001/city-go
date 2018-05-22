class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
    	t.string :vote_type
    	t.integer :vote_id
    	t.integer :user_id
    end
    add_index :votes, [:vote_type,:vote_id]
    add_index :votes, [:user_id,:vote_type]
  end
end
