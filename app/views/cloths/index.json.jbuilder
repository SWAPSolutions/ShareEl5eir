json.array!(@cloths) do |cloth|
  json.extract! cloth, :id, :size, :color, :user_id, :quantity, :description, :donated
  json.url cloth_url(cloth, format: :json)
end
