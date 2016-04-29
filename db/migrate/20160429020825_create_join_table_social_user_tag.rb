class CreateJoinTableSocialUserTag < ActiveRecord::Migration
  def change
    create_join_table :social_users, :tags do |t|
      t.index [:social_user_id, :tag_id]
      t.index [:tag_id, :social_user_id]
    end
  end
end
