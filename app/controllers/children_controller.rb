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
        format.html { redirect_to @child, notice: 'Child was successfully created.' }
        format.json { render :show, status: :created, location: @child }
      else
        format.html { render :new }
        format.json { render json: @child.errors, status: :unprocessable_entity }
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
        format.html { redirect_to @child, notice: 'Child was successfully updated.' }
        format.json { render :show, status: :ok, location: @child }
      else
        format.html { render :edit }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to children_url, notice: 'Child was successfully destroyed.' }
      format.json { head :no_content }
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
