class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :annual_income
      t.timestamps
    end
  end
end
