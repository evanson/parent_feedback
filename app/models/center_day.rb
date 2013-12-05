class CenterDay < ActiveRecord::Base
  belongs_to :center
  belongs_to :school_day
  has_many :student_days
  has_many :students, :through => :student_days
end
