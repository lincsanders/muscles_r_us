class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = Workout.where(user_id: current_user.id).all
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    redirect_to edit_workout_path @workout
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    @workout.excersises = []
    params[:excersises].each do |k,v|
      @workout.excersises << Excersise.where(user: current_user).find(k)
    end

    respond_to do |format|
      if @workout.save
        format.html { redirect_to workouts_path, notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        @workout.excersises = []
        params[:excersises].each do |k,v|
          @workout.excersises << Excersise.where(user: current_user).find(k)
        end
        format.html { redirect_to workouts_path, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.where(user_id: current_user.id).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:name)
    end
end
