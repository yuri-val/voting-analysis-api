class CreateVotingTables < ActiveRecord::Migration[5.1]
  def change
    create_table :voting_tables do |t|
      t.references :voting, foreign_key: true
      t.references :deputy, foreign_key: true
      t.references :voiting_result, foreign_key: true

      t.timestamps
    end
  end
end
