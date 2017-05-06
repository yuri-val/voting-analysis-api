class ZoneCalculator
  attr_reader :center, :values

  def initialize(zone_center)
    @center = zone_center
    calculate_zone
  end

  def calculate_zone
    zone_100 = @center.voting_rows.considered
    other_deputies_votings = VotingRow.where.not(deputy_id: @center.id)

    all_deputies = Deputy.where.not(id: @center.id).all

    @values = { from: @center.to_sh, to: [] }

    all_deputies.each do |dep|
      zone_values = []
      zone_100.each do |vote|
        dep_vote = other_deputies_votings.where(deputy_id: dep.id, voting_id: vote.voting_id)
        zone_values << if dep_vote.blank?
									        0
									      else
									        dep_vote.first.voting_result_id == vote.voting_result_id ? 100 : 0
									      end
    end
    dist = zone_values.size == 0 ? 0 : zone_values.sum / zone_values.size.to_f
    p [zone_values, zone_values.sum , zone_values.size.to_f]
    @values[:to] << {deputy: dep.to_sh, distance: dist}
  end
  @values[:to].sort_by!{ |h| h[:distance] }.reverse!
end

end
