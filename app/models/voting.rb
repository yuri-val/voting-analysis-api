class Voting < ApplicationRecord
  belongs_to :voting_summary
  has_many :voting_rows

  scope :by_deputy, -> (deputy_id) {joins(:voting_row).where("voting_row.deputy_id = #{deputy_id}")}

end
