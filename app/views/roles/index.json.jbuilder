json.array!(@roles) do |role|
  json.extract! role, :id, :user_id, :is_valid
  json.url role_url(role, format: :json)
end
