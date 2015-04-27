class AddWeightToWorkoutSession < ActiveRecord::Migration
  def change
    add_column :workout_sessions, :weight, :float
  end
end
