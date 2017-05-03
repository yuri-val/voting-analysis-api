class DeputiesController < ApplicationController
  before_action :set_deputy, only: [:show, :update, :destroy]

  # GET /deputies
  def index
    @deputies = Deputy.all

    render json: @deputies
  end

  # GET /deputies/1
  def show
    render json: @deputy
  end

  # POST /deputies
  def create
    @deputy = Deputy.new(deputy_params)

    if @deputy.save
      render json: @deputy, status: :created, location: @deputy
    else
      render json: @deputy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deputies/1
  def update
    if @deputy.update(deputy_params)
      render json: @deputy
    else
      render json: @deputy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deputies/1
  def destroy
    @deputy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deputy
      @deputy = Deputy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def deputy_params
      params.require(:deputy).permit(:index_number, :name)
    end
end
