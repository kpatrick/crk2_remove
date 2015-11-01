class FamilyYearsController < ApplicationController
  before_action :set_family_year, only: [:show, :edit, :update, :destroy]

  # GET /family_years
  # GET /family_years.json
  def index
    @family_years = FamilyYear.all
  end

  # GET /family_years/1
  # GET /family_years/1.json
  def show
  end

  # GET /family_years/new
  def new
    @family_year = FamilyYear.new
  end

  # GET /family_years/1/edit
  def edit
  end

  # POST /family_years
  # POST /family_years.json
  def create
    @family_year = FamilyYear.new(family_year_params)

    respond_to do |format|
      if @family_year.save
        format.html { redirect_to @family_year, notice: 'Family year was successfully created.' }
        format.json { render :show, status: :created, location: @family_year }
      else
        format.html { render :new }
        format.json { render json: @family_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_years/1
  # PATCH/PUT /family_years/1.json
  def update
    respond_to do |format|
      if @family_year.update(family_year_params)
        format.html { redirect_to @family_year, notice: 'Family year was successfully updated.' }
        format.json { render :show, status: :ok, location: @family_year }
      else
        format.html { render :edit }
        format.json { render json: @family_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_years/1
  # DELETE /family_years/1.json
  def destroy
    @family_year.destroy
    respond_to do |format|
      format.html { redirect_to family_years_url, notice: 'Family year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_year
      @family_year = FamilyYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_year_params
      params.require(:family_year).permit(:community_id, :family_id, :school_year, :picture, :notes)
    end
end
