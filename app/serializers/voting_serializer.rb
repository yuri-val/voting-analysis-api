class VotingSerializer < ActiveModel::Serializer
  attributes :id, :program_name, :department_name, :session, :date, :numder, :title,
              :summary_yea, :summary_nay, :summary_abstained, :not_voted, :absent
  has_one :voting_summary
  has_many :voting_tables
end
