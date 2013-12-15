class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  # GET /works.json
  def index
    @works = Work.all
    authorize! :index, Work
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
    authorize! :new, @work
  end

  # GET /works/1/edit
  def edit
    authorize! :edit, @work
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)
    authorize! :create, @work

    respond_to do |format|
      if @work.save
        format.html { redirect_to current_user, notice: 'Request successfully sent.' }
        format.json { render action: 'show', status: :created, location: @work }
      else
        format.html { render action: 'new' }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    authorize! :update, @work
    respond_to do |format|
      if @work.update(work_params)
        if @work.status == 'approved'
          WorkMailer.work_email(@work).deliver
        end
        format.html { redirect_to @work, notice: 'Request approved.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @work.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    authorize! :destroy, @work
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:student_id, :subject_id, :startdate, :enddate, :status)
    end
end
