class CreateSocialUsers < ActiveRecord::Migration
  def change
    create_table :social_users do |t|
      t.string :name
      t.string :role
      t.string :social_strategy
      t.string :search_strategy

      t.timestamps null: false
    end
  end
end
