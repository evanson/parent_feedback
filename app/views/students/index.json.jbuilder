json.array!(@students) do |student|
  json.extract! student, :firstname, :lastname, :dob, :center_id
  json.url student_url(student, format: :json)
end
