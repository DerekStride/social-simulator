class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :contents, through: :taggings, source: :tagable, source_type: 'Content'
  has_many :users, through: :taggings, source: :tagable, source_type: 'SocialUser'
  belongs_to :simulation

  TAGS = {
    FFaker::Skill => :specialty,
    FFaker::Skill => :tech_skill,
    FFaker::Sport => :name,
    FFaker::Product => :product,
    FFaker::Food => :ingredient,
    FFaker::Music => :genre,
    FFaker::Movie => :title
  }.freeze

  class << self
    def random
      ffaker = TAGS.keys.sample
      ffaker.public_send(TAGS[ffaker])
    end
  end
end
