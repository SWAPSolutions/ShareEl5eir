json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :description, :website, :photo, :device_id
  json.url organization_url(organization, format: :json)
end
