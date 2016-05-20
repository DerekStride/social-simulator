class CreateSimulations < ActiveRecord::Migration
  def change
    create_table :simulations do |t|

      t.timestamps null: false
    end
  end
end
