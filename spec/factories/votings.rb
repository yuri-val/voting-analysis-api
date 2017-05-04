FactoryGirl.define do
  factory :voting do
    program_name "MyString"
    department_name "MyString"
    session "MyString"
    date "2017-05-03 16:45:31"
    number "MyString"
    title "MyText"
    summary_yea 1
    summary_nay 1
    summary_abstained 1
    not_voted 1
    absent 1
    voting_summary 1
  end
end
