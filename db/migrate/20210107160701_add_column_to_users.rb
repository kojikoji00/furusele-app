class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, null: false, default: "sample"
    add_column :users, :income, default: "", :string, null: false
    add_column :users, :family, default: "", :string, null: false
  end
end
