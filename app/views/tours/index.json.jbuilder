json.array!(@tours) do |tour|
  json.extract! tour, :title, :description, :price
  json.url tour_url(tour, format: :json)
end