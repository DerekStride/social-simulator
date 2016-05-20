class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :contents, through: :taggings, source: :tagable, source_type: 'Content'
  has_many :users, through: :taggings, source: :tagable, source_type: 'SocialUser'
  belongs_to :simulation
end
