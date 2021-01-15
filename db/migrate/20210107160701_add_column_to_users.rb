class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, null: false, default: 'sample'
    add_column :users, :income, :string, default: ''
    add_column :users, :family, :string, default: ''
  end
end
