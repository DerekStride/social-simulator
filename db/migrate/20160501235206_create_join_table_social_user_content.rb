class CreateJoinTableSocialUserContent < ActiveRecord::Migration
  def change
    create_join_table :social_users, :contents do |t|
      t.index [:social_user_id, :content_id]
      t.index [:content_id, :social_user_id]
    end
  end
end
