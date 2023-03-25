class MomsController < ApplicationController
  before_action :set_mom, only: %i[ show edit update destroy ]

  # GET /moms or /moms.json
  def index
    @moms = Mom.all.order( 'date DESC' )
  end

  # GET /moms/1 or /moms/1.json
  def show
  end

  # GET /moms/new
  def new
    @mom = Mom.new
    @id = params[:id]
    @meet = Meet.find(params[:id])
    @all_agenda = Agenda.where("meet_id = ?" , @id)
    20.times {@mom.actions.build}
  end

  # GET /moms/1/edit
  def edit
  end

  # POST /moms or /moms.json
  def create
    @mom = Mom.new(mom_params)
  
    respond_to do |format|
      if @mom.save
        format.html { redirect_to mom_url(@mom), notice: "Mom was successfully created." }
        format.json { render :show, status: :created, location: @mom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moms/1 or /moms/1.json
  def update
    respond_to do |format|
      if @mom.update(mom_params)
        format.html { redirect_to mom_url(@mom), notice: "Mom was successfully updated." }
        format.json { render :show, status: :ok, location: @mom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moms/1 or /moms/1.json
  def destroy
    @mom.destroy

    respond_to do |format|
      format.html { redirect_to moms_url, notice: "Mom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mom
      @mom = Mom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mom_params
      params.require(:mom).permit(:date, :calledby, :descrption, :title, :venue, :callby_id, :meet_id, :attendby, :report , actions_attributes: %i[ id description budget deadline appointed_person  _destroy])
    end
end
