class CreateUserGameWinnerships < ActiveRecord::Migration
  def change
    create_table :user_game_winnerships do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
