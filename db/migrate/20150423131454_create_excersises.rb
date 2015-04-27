class CreateExcersises < ActiveRecord::Migration
  def change
    create_table :excersises do |t|
      t.string :name
      t.integer :sets
      t.integer :reps
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
