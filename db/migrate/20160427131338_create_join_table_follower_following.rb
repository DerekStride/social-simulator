class CreateJoinTableFollowerFollowing < ActiveRecord::Migration
  def change
    create_table :follower_following do |t|
      t.integer :follower_id
      t.integer :following_id
    end

    add_index(:follower_following, [:follower_id, :following_id], unique: true)
    add_index(:follower_following, [:following_id, :follower_id], unique: true)
  end
end
