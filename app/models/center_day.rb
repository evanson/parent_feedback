class CenterDay < ActiveRecord::Base
  belongs_to :center
  belongs_to :school_day
  has_many :student_days, :dependent => :destroy
  has_many :students, :through => :student_days

  before_destroy { |record| StudentDay.destroy_all "center_day_id = #{record.id}"}

end
