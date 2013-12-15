json.array!(@conferences) do |conference|
  json.extract! conference, :id, :confDate, :confTime, :instructor_id
  json.url conference_url(conference, format: :json)
end
