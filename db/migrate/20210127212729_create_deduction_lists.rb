class CreateDeductionLists < ActiveRecord::Migration[6.0]
  def change
    create_table :deduction_lists do |t|
      t.integer :income_id
      t.integer :family_id
      t.integer :deduction
      t.integer :deduction_id
      t.timestamps
    end
  end
end
