json.array!(@school_days) do |school_day|
  json.extract! school_day, :name, :abbrev
  json.url school_day_url(school_day, format: :json)
end
