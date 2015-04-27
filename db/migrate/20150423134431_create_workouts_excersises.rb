class CreateWorkoutsExcersises < ActiveRecord::Migration
  def change
    create_table :excersises_workouts do |t|
      t.belongs_to :excersise, index: true
      t.belongs_to :workout, index: true
    end
  end
end
