class WorkoutSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  serialize :completed_workout

  validates :user, presence: true
  validates :workout, presence: true

  def add_completed_workout params
    self.completed_workout = OpenStruct.new(params)
    self.completed_workout.excersises = []

    params["excersises"].each do |i, excersise|
      formatted_excersise = OpenStruct.new(excersise)
      formatted_excersise.was_succesful = excersise["was_succesful"].to_i == 1

      # Update the last_completed_weight if it was 100% succesful
      if formatted_excersise.was_succesful && (excersise_model = self.user.excersises.find(formatted_excersise.id))
        excersise_model.last_completed_weight = formatted_excersise.weight
        excersise_model.save
      end

      formatted_excersise.rep_sets = []

      excersise["rep_sets"].each do |j, rep_set|
        formatted_rep_set = OpenStruct.new(rep_set)

        formatted_rep_set.was_started = rep_set["was_started"].to_i == 1

        formatted_excersise.rep_sets << formatted_rep_set
      end

      self.completed_workout.excersises << formatted_excersise
    end
  end
end
