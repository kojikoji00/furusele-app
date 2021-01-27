class CreateCategoryDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :category_details do |t|
      t.string :name
      t.references :category
      t.string :satofull_id
      t.timestamps
    end
  end
end
