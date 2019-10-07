class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.datetime :force_date
      t.float :sum
      t.references :rate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
