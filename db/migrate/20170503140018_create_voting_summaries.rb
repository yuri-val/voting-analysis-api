class CreateVotingSummaries < ActiveRecord::Migration[5.1]
  def change
    create_table :voting_summaries do |t|
      t.string :name

      t.timestamps
    end
  end
end
