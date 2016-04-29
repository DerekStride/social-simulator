json.array!(@social_users) do |social_user|
  json.extract! social_user, :id, :name
  json.url social_user_url(social_user, format: :json)
end
