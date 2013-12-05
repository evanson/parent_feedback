class Center < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false}
  has_many :instructors, :dependent => :nullify
  has_many :students, :dependent => :nullify
  has_many :center_days, :dependent => :destroy
  has_many :school_days, :through => :center_days
  accepts_nested_attributes_for :school_days
end
