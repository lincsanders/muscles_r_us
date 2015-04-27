class WorkoutSessionsController < ApplicationController
  before_action :set_workout_session, only: [:show, :edit, :update, :destroy]
  before_action :set_workout, only: [:show, :edit, :update, :destroy, :new]

  # GET /workout_sessions
  # GET /workout_sessions.json
  def index
    @workout_sessions = WorkoutSession.where(user: current_user).order('created_at DESC').all
  end

  # GET /workout_sessions/1
  # GET /workout_sessions/1.json
  def show
  end

  # GET /workout_sessions/new
  def new
    @workout_session = WorkoutSession.new
    @workout_session.workout = @workout
    @workout_session.weight ||= current_user.current_weight
  end

  # GET /workout_sessions/1/edit
  def edit
    redirect_to workout_session_path @workout_session
  end

  # POST /workout_sessions
  # POST /workout_sessions.json
  def create
    @workout_session = WorkoutSession.new(workout_session_params)
    @workout_session.user_id = current_user.id
    @workout_session.add_completed_workout params[:completed_workout]

    respond_to do |format|
      if @workout_session.save
        format.html { redirect_to @workout_session, notice: 'Workout session was successfully created.' }
        format.json { render :show, status: :created, location: @workout_session }
      else
        format.html { render :new }
        format.json { render json: @workout_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_sessions/1
  # PATCH/PUT /workout_sessions/1.json
  def update
    respond_to do |format|
      if @workout_session.update(workout_session_params)
        format.html { redirect_to @workout_session, notice: 'Workout session was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout_session }
      else
        format.html { render :edit }
        format.json { render json: @workout_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_sessions/1
  # DELETE /workout_sessions/1.json
  def destroy
    @workout_session.destroy
    respond_to do |format|
      format.html { redirect_to workout_sessions_url, notice: 'Workout session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_session
      @workout_session = WorkoutSession.where(user: current_user).find(params[:id])
    end

    def set_workout
      if @workout_session && @workout_session.workout
        @workout = @workout_session.workout
      elsif params[:workout_id]
        @workout = Workout.where(user_id: current_user.id).find(params[:workout_id])
      elsif current_user.workouts
        @workout = current_user.workouts.first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_session_params
      params.require(:workout_session).permit(:workout_id, :weight)
    end
end
