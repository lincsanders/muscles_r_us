class ExcersisesController < ApplicationController
  before_action :set_excersise, only: [:show, :edit, :update, :destroy]

  # GET /excersises
  # GET /excersises.json
  def index
    @excersises = Excersise.where(user_id: current_user.id)
  end

  # GET /excersises/1
  # GET /excersises/1.json
  def show
    redirect_to edit_excersise_path @excersise
  end

  # GET /excersises/new
  def new
    @excersise = Excersise.new
  end

  # GET /excersises/1/edit
  def edit
  end

  # POST /excersises
  # POST /excersises.json
  def create
    @excersise = Excersise.new(excersise_params)
    @excersise.user_id = current_user.id

    respond_to do |format|
      if @excersise.save
        format.html { redirect_to excersises_path, notice: @excersise.name+' was successfully created.' }
        format.json { render :show, status: :created, location: @excersise }
      else
        format.html { render :new }
        format.json { render json: @excersise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excersises/1
  # PATCH/PUT /excersises/1.json
  def update
    respond_to do |format|
      if @excersise.update(excersise_params)
        format.html { redirect_to excersises_path, notice: @excersise.name+' was successfully updated.' }
        format.json { render :show, status: :ok, location: @excersise }
      else
        format.html { render :edit }
        format.json { render json: @excersise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excersises/1
  # DELETE /excersises/1.json
  def destroy
    @excersise.destroy
    respond_to do |format|
      format.html { redirect_to excersises_url, notice: 'Excersise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excersise
      @excersise = Excersise.where(user_id: current_user.id).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def excersise_params
      params.require(:excersise).permit(:name, :sets, :reps)
    end
end
