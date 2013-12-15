class Admin < User
  acts_as_messageable

  def name
    return "#{firstname} #{lastname}"
  end
end
