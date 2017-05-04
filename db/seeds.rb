# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Deputy.create([{index_number: 1, name: Faker::Name.name},
								{index_number: 2, name: Faker::Name.name},
								{index_number: 3, name: Faker::Name.name},
								{index_number: 4, name: Faker::Name.name}])

VotingResult.create([{name: "За"},
											{name: "Проти"},
											{name: "Утримався"},
											{name: "Не голосував", not_consider: true},
											{name: "Відсутній", not_consider: true}])

VotingSummary.create([{name: "ПРИЙНЯТО"},
											{name: "НЕ ПРИЙНЯТО"}])

Voting.create([{program_name: "Система поіменного голосування \"Рада Голос\"", department_name: "Броварська міська рада",
								session: "#{rand(50)} позачергова сесія міської ради від 22.12.16", date: DateTime.new(2016,12,22),
								numder: rand(50), title: Faker::Lorem.paragraph, summary_yea: 2, summary_nay: 4,
								summary_abstained: 1, not_voted: 4, absent: 2, voting_summary_id: VotingSummary.ids.sample},
							{program_name: "Система поіменного голосування \"Рада Голос\"", department_name: "Броварська міська рада",
								session: "#{rand(50)} позачергова сесія міської ради від 22.12.16", date: DateTime.new(2016,12,22),
								numder: rand(50), title: Faker::Lorem.paragraph, summary_yea: 3, summary_nay: 3,
								summary_abstained: 2, not_voted: 3, absent: 2, voting_summary_id: VotingSummary.ids.sample},
							{program_name: "Система поіменного голосування \"Рада Голос\"", department_name: "Броварська міська рада",
								session: "#{rand(50)} позачергова сесія міської ради від 22.12.16", date: DateTime.new(2016,12,22),
								numder: rand(50), title: Faker::Lorem.paragraph, summary_yea: 4, summary_nay: 2,
								summary_abstained: 3, not_voted: 2, absent: 2, voting_summary_id: VotingSummary.ids.sample},
							{program_name: "Система поіменного голосування \"Рада Голос\"", department_name: "Броварська міська рада",
								session: "#{rand(50)} позачергова сесія міської ради від 22.12.16", date: DateTime.new(2016,12,22),
								numder: rand(50), title: Faker::Lorem.paragraph, summary_yea: 5, summary_nay: 1,
								summary_abstained: 4, not_voted: 1, absent: 2, voting_summary_id: VotingSummary.ids.sample}])

VotingTable.create([{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample},
										{voting_id: Voting.ids.sample, deputy_id: Deputy.ids.sample, voting_result_id: VotingResult.ids.sample}])
