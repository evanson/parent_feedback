class Conference < ActiveRecord::Base
  belongs_to :instructor
  has_and_belongs_to_many :users
end
