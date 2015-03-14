json.array!(@categories) do |category|
  json.extract! category, :id, :recipe_id, :menu_id, :category_number
  json.url category_url(category, format: :json)
end