class VotingTable < ApplicationRecord
  belongs_to :voting
  belongs_to :deputy
  belongs_to :voting_result

  scope :by_voting, -> (voting_id) { where(voting_id: voting_id) }
  scope :by_deputy, -> (deputy_id) { where(deputy_id: deputy_id) }
  scope :considered, -> { joins(:voting_result).where("not voting_results.not_consider") }


end
