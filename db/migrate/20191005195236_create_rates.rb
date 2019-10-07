class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.float :sum
      t.string :title
      t.string :code
      t.datetime :force_date
      t.float :force_sum

      t.timestamps
    end
  end
end
