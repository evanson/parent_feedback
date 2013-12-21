class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    #alias_action :index, :show, :to => :read

    #Admin
    can :manage, :all if user.type.to_s.downcase == "admin"

    #Instructor
    can [:edit, :update, :read], Instructor, :id => user.id if user.type.to_s.downcase == "instructor"
    cannot :index, Instructor if user.type.to_s.downcase == "instructor"
    can [:create, :read, :edit, :update], Parent if user.type.to_s.downcase == "instructor"
    can [:update, :edit, :read], Center, :id => user.center_id if user.type.to_s.downcase == "instructor"
    cannot :index, Center if user.type.to_s.downcase == "instructor"

    #Parent
    can [:edit, :update, :read], Parent, :id => user.id if user.type.to_s.downcase == "parent"
    cannot :index, Parent if user.type.to_s.downcase == "parent"

    #Student
    can :manage, Student, :instructor_id => user.id if user.type.to_s.downcase == "instructor"
    can :index, Student, :parent_id => user.id if user.type.to_s == "Parent"

    #Subject

    #Work
    can [:new, :create], Work if user.type.to_s.downcase == "parent"
    cannot [:edit, :update, :index, :destroy], Work if user.type.to_s == "Parent"
    can [:read, :edit, :index, :update], Work if user.type.to_s == "Instructor"
    cannot [:new, :create, :destroy], Work if user.type.to_s == "Instructor"

    #Conference
    can :manage, Conference if user.type.to_s == "Instructor"
    can :index, Conference if user.type.to_s == "Parent"
  end
end
