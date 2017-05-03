module Api::V1
  class VotingTablesController < ApiController
  before_action :set_voting_table, only: [:show, :update, :destroy]

  # GET /voting_tables
  def index
    @voting_tables = VotingTable.all

    render json: @voting_tables
  end

  # GET /voting_tables/1
  def show
    render json: @voting_table
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting_table
      @voting_table = VotingTable.find(params[:id])
    end

  end
end
