json.array!(@works) do |work|
  json.extract! work, :id, :student_id, :subject_id, :startdate, :enddate, :status
  json.url work_url(work, format: :json)
end
