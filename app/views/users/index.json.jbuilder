json.array!(@users) do |user|
  json.extract! user, :id, :f_name, :l_name, :role, :bio, :phone, :address, :photo, :device_id
  json.url user_url(user, format: :json)
end
