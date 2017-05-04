class CreateVotingResults < ActiveRecord::Migration[5.1]
  def change
    create_table :voting_results do |t|
      t.string :name
      t.boolean :not_consider, default: false

      t.timestamps
    end
  end
end
