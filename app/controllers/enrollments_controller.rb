class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    child = @enrollment.child
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to child, notice: 'Enrollment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:school_year, :child_id, :child_code, :sponsor_id, :sponsor_code, :newyear_shirt_size, :newyear_pant_size, :newyear_shoe_size, :midyear_shirt_size, :midyear_pant_size, :midyear_shoe_size, :newyear_attendance_id, :newyear_attendance_notes, :midyear_attendance_id, :midyear_attendance_notes, :report_card, :report_notes, :work_form, :work_form_notes, :pass, :pass_notes, :grades, :grades_notes, :letter, :not_included)
    end
end
