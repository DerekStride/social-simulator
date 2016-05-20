class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.references :producer
      t.references :simulation

      t.timestamps null: false
    end
  end
end
