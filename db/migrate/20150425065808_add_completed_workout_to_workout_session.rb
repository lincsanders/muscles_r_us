class AddCompletedWorkoutToWorkoutSession < ActiveRecord::Migration
  def change
    add_column :workout_sessions, :completed_workout, :text
  end
end
