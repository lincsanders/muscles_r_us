class AddCompletedWorkoutToWorkoutSessions < ActiveRecord::Migration
  def change
    add_column :workout_sessions, :completed_workout, :text, default: OpenStruct.new({completed_excersises: []})
  end
end
