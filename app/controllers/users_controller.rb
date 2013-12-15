class UsersController < ApplicationController
  #load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    # @users = User.where(:type => params[:type])
    @users = user_type.paginate(page: params[:page])
    @user_type = user_type.to_s.downcase
    authorize! :index, user_type
  end

  def show
    @recipient = User.find_by_email("wachiraevanson@gmail.com")
    #@user.send_message(@recipient, "Just testing gem mailboxer", "gem test")
    authorize! :read, @user
  end

  def new
    @user = user_type.new
    authorize! :new, @user
  end

  def edit
    authorize! :edit, @user
  end

  def create
    @user = user_type.new(user_params)
    authorize! :create, @user
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "#{@user.type} was successfully created." }
        format.json { render action: 'show', status: :created, location: @user }
        UserMailer.user_email(@user).deliver
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "#{@user.type} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to eval("#{@user.type.to_s.downcase}s_url") }
      format.json { head :no_content }
    end
  end

  private
    def user_type
      params[:type].constantize
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = user_type.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if user_type.to_s == "Instructor"
        params.require(user_type.to_s.downcase.to_sym).permit(:type, :firstname, :lastname, :email, :center_id, :password, :password_confirmation, :status)
      else
        params.require(user_type.to_s.downcase.to_sym).permit(:type, :firstname, :lastname, :email, :password, :password_confirmation, :status)
      end
    end
end
