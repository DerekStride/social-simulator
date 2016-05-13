class PopularitySocialStrategy < SocialStrategy
  def self.socialize(user, masterpieces)
    user.liked_content << masterpieces.first
  end
end
