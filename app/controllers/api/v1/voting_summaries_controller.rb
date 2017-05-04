module Api::V1
  class VotingSummariesController < ApiController
    before_action :set_voting_summary, only: [:show, :update, :destroy]

    # GET /voting_summaries
    def index
      @voting_summaries = VotingSummary.all

      render json: @voting_summaries
    end

    # GET /voting_summaries/1
    def show
      render json: @voting_summary
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting_summary
      @voting_summary = VotingSummary.find(params[:id])
    end

  end
end
