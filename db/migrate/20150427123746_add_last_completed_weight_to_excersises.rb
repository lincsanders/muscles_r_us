class AddLastCompletedWeightToExcersises < ActiveRecord::Migration
  def change
    add_column :excersises, :last_completed_weight, :float, default: 17.5
  end
end
