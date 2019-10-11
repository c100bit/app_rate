class AddIndexToRatesOnCode < ActiveRecord::Migration[6.0]
  def change
    add_index :rates, 'lower(code)', 
      name: 'index_rates_on_lower_code', unique: true
  end
end
