class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.boolean :empty

      t.timestamps
    end
  end
end
