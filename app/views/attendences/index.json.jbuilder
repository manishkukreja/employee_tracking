json.array!(@attendences) do |attendence|
  json.extract! attendence, :id, :email, :time_in, :time_out
  json.url attendence_url(attendence, format: :json)
end
