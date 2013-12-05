class SchoolDay < ActiveRecord::Base
  has_many :center_days
  has_many :centers, :through => :center_days
  before_save do |school_day|
    school_day.name = name.downcase.capitalize
    school_day.abbrev = abbrev.downcase.capitalize
  end
  validate :day_count_limit, :on => :create
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :abbrev, presence: true, uniqueness: { case_sensitive: false }

  private

  def day_count_limit
    school_days = SchoolDay.all
    if school_days.count >= 7
      errors.add(:base, "Exceeds number of days in a week")
    end
  end
end
