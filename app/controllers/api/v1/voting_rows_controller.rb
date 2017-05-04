module Api::V1
  class VotingRowsController < ApiController
    before_action :set_voting_row, only: [:show, :update, :destroy]

    # GET /voting_rows
    def index
      voting_id = params[:voting_id]
      deputy_id = params[:deputy_id]

      @voting_rows = VotingRow.all
      @voting_rows = @voting_rows.by_voting(voting_id) unless voting_id.nil?
      @voting_rows = @voting_rows.by_deputy(deputy_id) unless deputy_id.nil?

      render json: @voting_rows
    end

    # GET /voting_rows/1
    def show
      render json: @voting_row
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting_row
      @voting_row = VotingRow.find(params[:id])
    end

  end
end
