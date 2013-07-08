json.array!(@tourdates) do |tourdate|
  json.extract! tourdate, :startdate
  json.url tourdate_url(tourdate, format: :json)
end
