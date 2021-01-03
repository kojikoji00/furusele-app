class CreateSelects < ActiveRecord::Migration[6.0]
  def change
    create_table :selects do |t|

      t.timestamps
    end
  end
end
