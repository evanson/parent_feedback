class Instructor < User
  belongs_to :center
  validates_existence_of :center
  has_many :students
end
