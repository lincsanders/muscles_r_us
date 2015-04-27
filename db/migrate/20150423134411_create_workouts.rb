class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
