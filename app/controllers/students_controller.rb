class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    if current_user.type.to_s == "Admin"
      @students = Student.paginate(page: params[:page])
    elsif current_user.type.to_s == "Instructor"
      @students = Student.paginate(page: params[:page]).where(instructor_id: current_user.id)
    elsif current_user.type.to_s == "Parent"
      @students = Student.paginate(page: params[:page]).where(parent_id: current_user.id)
    end
    authorize! :index, Student
    respond_to do |format|
      format.html
      format.csv #{ send_data @students.to_csv }
      format.xls #{ send_data @students.to_csv(col_sep: "\t") }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    authorize! :read, Student
  end

  # GET /students/new
  def new
    # Creating a student involves creating their parent, adding attendance days and subjects they'll take
    @parent = Parent.new
    1.times do
      student = @parent.students.build
      student.center_days.build
      student.subjects.build
    end
    authorize! :new, Student
  end

  # GET /students/1/edit
  def edit
    authorize! :edit, Student
  end

  # POST /students
  # POST /students.json
  def create
    if Parent.exists?(email: params[:parent][:email])
      @parent = Parent.find_by_email(params[:parent][:email])
      @status = 'existing'
      attrs = Hash.new
      attrs = params[:parent][:students_attributes]["0"].deep_dup
      attrs[:parent_id] = @parent.id
      params.clear
      params[:student] = attrs.deep_dup
      @newstudent = Student.new(student_params)
    else
      @parent = Parent.new(new_student_params)
      @status = 'new'
    end

    authorize! :create, Student
    if @status == 'new'
      respond_to do |format|
        if @parent.save
          UserMailer.user_email(@parent).deliver
          format.html { redirect_to students_path, notice: 'Student was successfully created.' }
          format.json { render action: 'show', status: :created, location: @student }
        else
          format.html { render action: 'new' }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @newstudent.save
          format.html { redirect_to students_path, notice: 'Student was successfully created.' }
          format.json { render action: 'show', status: :created, location: @student }
        else
          @student = @newstudent
          format.html { render action: 'new' }
          format.json { render json: @newstudent.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    authorize! :update, Student
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    authorize! :destroy, Student
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  def import
    Student.import(params[:file])
    redirect_to students_path, notice: "Students imported"
  end

  def center_days_partial
    @center_days = CenterDay.where(center_id: params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:firstname, :lastname, :dob, :center_id, :instructor_id, :parent_id, :center_day_ids => [], :subject_ids => [])
    end

    def new_student_params
      params.require(:parent).permit(:firstname, :lastname, :email, :password, :password_confirmation, :status, students_attributes: [:firstname, :lastname, :dob, :center_id, :instructor_id, :center_day_ids => [], :subject_ids => []])
    end
end
