class StepsController < ApplicationController
  # before_action :set_step, only: [:show, :edit, :update, :destroy]
  before_action :load_list
  # GET /steps
  # GET /steps.json
  def index
    @steps = @list.steps.all

  end

  # GET /steps/1
  # GET /steps/1.json
  def show
    @step = Step.find(params[:id])
    @steps = @list.steps.find(params[:id])
  end

  # GET /steps/new
  def new
    @step = @list.steps.new
  end

  # GET /steps/1/edit
  def edit
    @step = Step.find(params[:id])

  end

  # POST /steps
  # POST /steps.json
  def create
    @step = @list.steps.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to [@list], notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    @step = @list.steps.update(params[:id], step_params)

    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to list_steps_path, notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step = @list.steps.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to list_steps_path(@list), notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_step
    #   @step = Step.find(params[:id])
    # end

    def load_list
      @list = List.find(params[:list_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:info, :list_id)
    end
end
