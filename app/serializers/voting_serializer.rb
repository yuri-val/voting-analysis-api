class VotingSerializer < ActiveModel::Serializer
  attributes :id, :program_name, :department_name, :session, :date, :numder, :title, :summary_yea, :summary_nay, :summary_abstained, :not_voted, :absent, :voting_summary
end
