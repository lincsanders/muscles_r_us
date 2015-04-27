class Excersise < ActiveRecord::Base
  belongs_to :user
  has_many :rep_sets
  has_and_belongs_to_many :workouts

  validates :name, uniqueness: {scope: :user_id}
  validates :user, presence: true

  after_save :create_rep_sets

  def next_weight
    self.last_completed_weight + self.user.weight_increment
  end

  def completed
    false
  end

  private

  def create_rep_sets
    self.rep_sets.delete_all

    self.sets.times do
      RepSet.create({
        excersise_id: self.id,
        reps: self.reps
      })
    end
  end
end
