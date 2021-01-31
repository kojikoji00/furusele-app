class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :user, null: false
      t.integer :category_id
      t.timestamps
    end
  end
end
