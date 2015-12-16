class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  # GET /children.json
  def index
    @children = Child.all.includes(family: [:community]).order(:code)
  end

  # GET /children/1
  # GET /children/1.json
  def show
    @community = @child.try(:family).try(:community)
  end

  # GET /children/new
  def new
    @child = Child.new
    @child.family_id = params[:family_id] if params[:family_id]
  end

  # GET /children/1/edit
  def edit
  end

  # POST /children
  # POST /children.json
  def create
    @child = Child.new(child_params)

    respond_to do |format|
      begin
        saved =  @child.save
      rescue ActiveRecord::RecordNotUnique => e
        @child.errors[:base] << e.message
        saved = false
      rescue => e
        @child.errors[:base] << e.message
        saved = false
      end
      if saved
        format.html { redirect_to @child, notice: t('child_created') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /children/1
  # PATCH/PUT /children/1.json
  def update
    respond_to do |format|
      begin
        updated = @child.update(child_params)
      rescue ActiveRecord::RecordNotUnique => e
        @child.errors[:base] << e.message
        updated = false
      rescue => e
        @child.errors[:base] << e.message
        updated = false
      end
      if updated
        format.html { redirect_to @child, notice: t("child_updated")}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    family = @child.family
    @child.destroy
    respond_to do |format|
      format.html { redirect_to family, notice: t("child_deleted") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_params
      params.require(:child).permit(:code, :family_id, :notes, :given_name1, :given_name2, :family_name1, :family_name2, :preferred_name, :dob, :status, :gender)
    end
end
