class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :create_date
      t.datetime :end_date
      t.boolean :active_game
      t.integer :drink_id
      t.string :password

      t.timestamps
    end
  end
end
