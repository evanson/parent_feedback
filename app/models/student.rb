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
  #validates_presence_of :subjects
  #validates_presence_of :student_days

  has_many :works, :dependent => :destroy
  validates :firstname, presence: true
  validates :lastname, presence: true
  validate do
    #check_center_match
  end

  def self.search(search)
    if search
      search.capitalize!
      where('firstname LIKE ? OR lastname LIKE ?', "%#{search}%", "%#{search}%")
    else
     scoped
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |student|
        csv << student.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    puts spreadsheet.first_row
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      attrs = Hash.new
      info = Hash[[header, spreadsheet.row(i)].transpose]
      unless info.empty?
        @instructor = Instructor.find_by_email(info["instructor_email"])
        center = info["center"].downcase.capitalize
        @center = Center.find_by_name(center)
        if Parent.exists?(email: info["email"])
          @parent = Parent.find_by_email(info["email"])
          attrs[:student] = { "firstname" => info["firstname"], "lastname" => info["lastname"],"dob" => info["dob"], "center_id" => @center.id, "instructor_id" => @instructor.id }
          attrs[:student][:parent_id] = @parent.id
          Student.create! attrs[:student]
        else
          attrs[:parent] = { "firstname" => info["parent_firstname"], "lastname" =>info["parent_lastname"], "email" => info["email"], "password" => info["password"],"password_confirmation" => info["password"], "students_attributes" => { "0" => { "firstname" => info["firstname"], "lastname" => info["lastname"], "dob" => info["dob"], "center_id" => @center.id, "instructor_id" => @instructor.id }}}
          Parent.create! attrs[:parent]
        end
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
      end
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
