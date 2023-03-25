class MeetsController < ApplicationController
  before_action :set_meet, only: %i[ show edit update destroy ]

  def index
    @meets = Meet.all
  end

  def show
    @all_agenda = Agenda.where( "meet_id = ?" , @meet.id )
    @mom = Mom.where( " meet_id = ? " ,@meet.id )
    @action = Action.where( " mom_id = ? " ,@mom.ids )
  end

  def new
    @meet = Meet.new
  end

  def edit
      @all_agenda = Agenda.where("meet_id = ?" , @meet.id)
  end

  def create
    @meet = Meet.new(meet_params)
    respond_to do |format|
      if @meet.save
        format.html { redirect_to meet_url(@meet), notice: "Meeting was successfully created." }
        format.json { render :show, status: :created, location: @meet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meet.update(meet_params)
        format.html { redirect_to meet_url(@meet), notice: "Meeting was successfully updated." }
        format.json { render :show, status: :ok, location: @meet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Mom.where(:meet_id => @meet.id).destroy_all
    @meet.destroy
    respond_to do |format|
      format.html { redirect_to meets_url, notice: "Meeting + Agendas was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_meet
      @meet = Meet.find(params[:id])
    end

    def meet_params
      params.require(:meet).permit(:user_id, :date, :title, :description ,:type2)
    end
end
