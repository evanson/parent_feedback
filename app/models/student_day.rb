class StudentDay < ActiveRecord::Base
  belongs_to :student
  belongs_to :center_day
end
