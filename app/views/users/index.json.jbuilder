json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :password, :dob, :dependent
  json.url user_url(user, format: :json)
end
