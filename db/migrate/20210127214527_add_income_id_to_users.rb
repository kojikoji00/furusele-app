class AddIncomeIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :income_id, :integer
    add_column :users, :family_id, :integer
  end
end
