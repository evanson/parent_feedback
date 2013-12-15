class Parent < User
  has_many :students, :dependent => :destroy
  accepts_nested_attributes_for :students
  #has_and_belongs_to_many :conferences
  acts_as_messageable

  def name
    return "#{firstname} #{lastname}"
  end

  def mailboxer_email(parent)
    return "#{email}"
  end
end
