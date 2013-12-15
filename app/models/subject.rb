class Subject < ActiveRecord::Base
  has_and_belongs_to_many :students
  before_save { |subject| subject.name = name.downcase.capitalize }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :works, :dependent => :destroy
end
