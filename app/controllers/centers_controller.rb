class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]

  # GET /centers
  # GET /centers.json
  def index
    @centers = Center.all
    authorize! :index, Center
  end

  # GET /centers/1
  # GET /centers/1.json
  def show
    authorize! :edit, @center
  end

  # GET /centers/new
  def new
    @center = Center.new
    authorize! :new, @center
  end

  # GET /centers/1/edit
  def edit
    authorize! :edit, @center
  end

  # POST /centers
  # POST /centers.json
  def create
    @center = Center.new(center_params)
    authorize! :create, @center
    respond_to do |format|
      if @center.save
        format.html { redirect_to @center, notice: 'Center was successfully created.' }
        format.json { render action: 'show', status: :created, location: @center }
      else
        format.html { render action: 'new' }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centers/1
  # PATCH/PUT /centers/1.json
  def update
    respond_to do |format|
      authorize! :update, @center
      if @center.update(center_params)
        format.html { redirect_to @center, notice: 'Center was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centers/1
  # DELETE /centers/1.json
  def destroy
    authorize! :destroy, @center
    @center.destroy
    respond_to do |format|
      format.html { redirect_to centers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @center = Center.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_params
      params.require(:center).permit(:name)
    end
end
