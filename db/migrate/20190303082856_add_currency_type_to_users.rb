class AddCurrencyTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :currency_type, :integer, default: 0, null: false
  end
end
