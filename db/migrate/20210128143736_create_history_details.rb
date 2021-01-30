class CreateHistoryDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :history_details do |t|
      t.references :history, null: false
      t.string :title
      t.string :city
      t.string :donation_amount #寄付金額
      t.string :infomation
      t.string :evaluation #評価
      t.string :address
      t.string :image_path
      t.timestamps
    end
  end
end
