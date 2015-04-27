class User < ActiveRecord::Base
  has_many :excersises
  has_many :workouts
  has_many :workout_sessions
  after_create :give_default_excersises_and_workouts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, length: { in: 2..20 }
  validates :nickname, uniqueness: true

  def give_default_excersises_and_workouts
    # Clear our existing related records
    Workout.where(user_id: self.id).delete_all
    Excersise.where(user_id: self.id).delete_all

    default_excersises.each do |excersise_params|
      excersise = Excersise.create(excersise_params)
      excersise.user_id = self.id
      excersise.save
    end

    default_workouts.each do |workout_params|
      workout = Workout.new
      workout.user_id = self.id
      workout.name = workout_params[:name]

      workout.save

      workout_params[:excersises].each do |excersise_name|
        workout.excersises << Excersise.where(user_id: self.id, name: excersise_name).first
      end
    end
  end

  def weight_increment
    2.5
  end

  def weight_units
    'kg'
  end

  def most_recent_workout_session
    self.workout_sessions.order('created_at DESC').first
  end

  def current_weight
    if most_recent_workout_session
      most_recent_workout_session.weight
    else
      80
    end
  end

  private

  def default_excersises
    [
      {
        name: 'Squat',
        sets: 5,
        reps: 5
      },
      {
        name: 'Bench Press',
        sets: 5,
        reps: 5
      },
      {
        name: 'Overhead Press',
        sets: 5,
        reps: 5
      },
      {
        name: 'Barbell Row',
        sets: 5,
        reps: 5
      },
      {
        name: 'Deadlift',
        sets: 1,
        reps: 5
      }
    ]
  end

  def default_workouts
    [
      {
        name: 'Stronglifts Workout A',
        excersises: [
          'Squat',
          'Bench Press',
          'Barbell Row'
        ]
      },
      {
        name: 'Stronglifts Workout B',
        excersises: [
          'Squat',
          'Overhead Press',
          'Deadlift'
        ]
      },
    ]
  end
end
