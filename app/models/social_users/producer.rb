class Producer < SocialUser
  delegate :consumers, :producers, to: :social_users
  has_many :masterpieces, class_name: 'Content'
end
