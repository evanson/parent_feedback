class Center < ActiveRecord::Base
  CENTER_DAYS_MIN = 1
  validates :name, presence: true, uniqueness: { case_sensitive: false}
  has_many :instructors, :dependent => :nullify
  has_many :students, :dependent => :nullify
  has_many :center_days, :dependent => :destroy
  has_many :school_days, :through => :center_days
  accepts_nested_attributes_for :school_days
  validate do
    check_center_days_count
  end

  private

  def center_day_count_valid?
    center_days.count >= CENTER_DAYS_MIN
  end

  def check_center_days_count
    unless center_day_count_valid?
      errors.add(:base, "Center must have at least 1 day active")
    end
  end
end
