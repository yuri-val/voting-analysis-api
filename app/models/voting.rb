class Voting < ApplicationRecord
  belongs_to :voting_summary
  has_many :voting_tables

  scope :by_deputy, -> (deputy_id) {joins(:voting_table).where("voting_table.deputy_id = #{deputy_id}")}

end
