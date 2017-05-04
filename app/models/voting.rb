class Voting < ApplicationRecord
  belongs_to :voting_summary
  has_many :voting_rows

  scope :by_deputy, -> (deputy_id) {joins(:voting_rows).where("voting_rows.deputy_id = #{deputy_id}")}

end
