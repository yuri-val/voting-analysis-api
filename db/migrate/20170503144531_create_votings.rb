class CreateVotings < ActiveRecord::Migration[5.1]
  def change
    create_table :votings do |t|
      t.string :program_name
      t.string :department_name
      t.string :session
      t.string :number
      t.datetime :date
      t.string :title
      t.text :content
      t.integer :summary_yea
      t.integer :summary_nay
      t.integer :summary_abstained
      t.integer :not_voted
      t.integer :absent
      t.references :voting_summary

      t.timestamps
    end
  end
end
