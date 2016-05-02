class Content < ActiveRecord::Base
  has_many :taggings, as: :tagable
  has_many :tags, as: :tagable, through: :taggings
  has_and_belongs_to_many :likes, class_name: 'SocialUser'
  belongs_to :producer
end
