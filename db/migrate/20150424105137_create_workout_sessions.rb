class CreateWorkoutSessions < ActiveRecord::Migration
  def change
    create_table :workout_sessions do |t|
      t.integer :workout_id, index: true
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
