class RemoveCompletedWorkoutFromWorkoutSessions < ActiveRecord::Migration
  def change
    remove_column :workout_sessions, :completed_workout
  end
end
