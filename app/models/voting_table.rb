class VotingTable < ApplicationRecord
  belongs_to :voting
  belongs_to :deputy
  belongs_to :voiting_result
end
