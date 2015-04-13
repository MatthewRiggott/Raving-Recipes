json.array!(@directions) do |direction|
  json.extract! direction, :id, :step_number, :recipe_id, :body
  json.url direction_url(direction, format: :json)
end
