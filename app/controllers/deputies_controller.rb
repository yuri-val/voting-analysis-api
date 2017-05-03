class DeputiesController < ApplicationController
	before_action :set_deputy, only: [:show]

  # GET /deputies
  def index
    @deputies = Deputy.all

    render json: @deputies
  end

  # GET /deputies/1
  def show
    render json: @deputy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deputy
      @deputy = Deputy.find(params[:id])
    end

end
