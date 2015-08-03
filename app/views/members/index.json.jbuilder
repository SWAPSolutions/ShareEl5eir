json.array!(@members) do |member|
  json.extract! member, :id, :f_name, :l_name, :role, :bio, :phone, :address, :photo, :devise_id
  json.url member_url(member, format: :json)
end
