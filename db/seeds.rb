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
											{name: "Не голосував"},
											{name: "Відсутній"}])

VotingSummary.create([{name: "ПРИЙНЯТО"},
											 {name: "НЕ ПРИЙНЯТО"}])

Voting.create([{program_name: "Система поіменного голосування \"Рада Голос\"", department_name: "", session: "", date: "",
									numder: "", title: "", summary_yea: 0, summary_nay: 0,
									summary_abstained: 0, not_voted: 0, absent: 0, voting_summary: VotingSummary.ids.sample},
								{program_name: "Система поіменного голосування \"Рада Голос\"", department_name: "", session: "", date: "",
									numder: "", title: "", summary_yea: 0, summary_nay: 0,
									summary_abstained: 0, not_voted: 0, absent: 0, voting_summary: VotingSummary.ids.sample},
								{program_name: "Система поіменного голосування \"Рада Голос\"", department_name: "", session: "", date: "",
									numder: "", title: "", summary_yea: 0, summary_nay: 0,
									summary_abstained: 0, not_voted: 0, absent: 0, voting_summary: VotingSummary.ids.sample},
								{program_name: "Система поіменного голосування \"Рада Голос\"", department_name: "", session: "", date: "",
									numder: "", title: "", summary_yea: 0, summary_nay: 0,
									summary_abstained: 0, not_voted: 0, absent: 0, voting_summary: VotingSummary.ids.sample}])