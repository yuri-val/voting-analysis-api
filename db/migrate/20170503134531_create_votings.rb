class CreateVotings < ActiveRecord::Migration[5.1]
  def change
    create_table :votings do |t|
      t.string :program_name
      t.string :department_name
      t.string :session
      t.datetime :date
      t.string :numder
      t.text :title
      t.integer :summary_yea
      t.integer :summary_nay
      t.integer :summary_abstained
      t.integer :not_voted
      t.integer :absent
      t.integer :voting_summary

      t.timestamps
    end
  end
end
