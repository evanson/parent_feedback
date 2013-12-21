class Student < ActiveRecord::Base
  SUBJECTS_MIN = 1
  STUDENT_DAYS_MIN = 1
  belongs_to :parent
  belongs_to :center
  belongs_to :instructor
  has_many :student_days, :dependent => :destroy
  has_many :center_days, :through => :student_days
  accepts_nested_attributes_for :center_days

  has_and_belongs_to_many :subjects
  accepts_nested_attributes_for :subjects
  before_destroy { subjects.clear }
  validates_presence_of :subjects
  validates_presence_of :student_days

  has_many :works, :dependent => :destroy
  validates :firstname, presence: true
  validates :lastname, presence: true
  validate do
    #check_center_match
  end

  private

  #Ensures students center matches Instructor's center
  def check_center_match
    unless center == instructor.center
      errors.add(:base, "Student's center must match instructor's center")
    end
  end

  def subject_count_valid?
    subjects.count >= SUBJECTS_MIN
  end

  def check_subjects_count
    unless subject_count_valid?
      errors.add(:base, "Student must have at least 1 subject")
    end
  end

  def student_day_count_valid?
    center_days.count >= STUDENT_DAYS_MIN
  end

  def check_student_days_count
    unless student_day_count_valid?
      errors.add(:base, "Student must have at least 1 day active")
    end
  end
end
