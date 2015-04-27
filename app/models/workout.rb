class Workout < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :excersises

  validates :user, presence: true

end
