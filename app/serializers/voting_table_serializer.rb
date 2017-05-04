class VotingTableSerializer < ActiveModel::Serializer
  attributes :id
  has_one :voting
  has_one :deputy
  has_one :voting_result
end
