class Producer < SocialUser
  delegate :consumers, :producers, to: :social_users
end
