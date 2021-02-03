class CreateHistoryDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :history_details do |t|
      t.references :history, null: false
      t.string :link
      t.string :name
      t.string :city
      t.string :price #寄付金額
      t.string :description
      t.string :picture_image_path
      t.string :review_image_path #評価
      t.timestamps
    end
  end
end
