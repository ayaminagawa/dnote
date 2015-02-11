json.array!(@users) do |user|
  json.extract! user, :name, :gender, :sns_name
  json.url user_url(user, format: :json)
end