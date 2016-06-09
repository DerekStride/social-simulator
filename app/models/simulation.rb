class Simulation < ActiveRecord::Base
  SOCIAL_STRATEGIES = ['popularity'].freeze
  SEARCH_STRATEGIES = %w(popularity similarity).freeze

  has_many :users, class_name: 'SocialUser'
  has_many :tags
  has_many :content, class_name: 'Content'

  accepts_nested_attributes_for :users
end
