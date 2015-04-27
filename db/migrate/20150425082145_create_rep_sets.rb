class CreateRepSets < ActiveRecord::Migration
  def change
    create_table :rep_sets do |t|
      t.integer :excersise_id
      t.integer :reps
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
