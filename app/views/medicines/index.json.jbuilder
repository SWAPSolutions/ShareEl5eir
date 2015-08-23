json.array!(@medicines) do |medicine|
  json.extract! medicine, :id, :name, :exp_date, :concentration, :quantity, :description, :donated, :user_id
  json.url medicine_url(medicine, format: :json)
end
