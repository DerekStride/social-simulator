class SocialUser < ActiveRecord::Base
  self.inheritance_column = :role

  scope :consumers, -> { where(role: 'Consumer') }
  scope :producers, -> { where(role: 'Producer') }

  has_and_belongs_to_many :followers,
                          class_name: 'SocialUser',
                          foreign_key: :following_id,
                          association_foreign_key: :follower_id,
                          join_table: :follower_following
  has_and_belongs_to_many :following,
                          class_name: 'SocialUser',
                          foreign_key: :follower_id,
                          association_foreign_key: :following_id,
                          join_table: :follower_following
  has_and_belongs_to_many :tags
end
