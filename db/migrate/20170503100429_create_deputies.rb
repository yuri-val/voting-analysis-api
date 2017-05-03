class CreateDeputies < ActiveRecord::Migration[5.1]
  def change
    create_table :deputies do |t|
      t.integer :index_number
      t.string :name

      t.timestamps
    end
  end
end
