class HomeController < ApplicationController
  before_action :set_meet, only: %i[ delete ]

  def index
    @meets = Meet.all.order( 'date DESC' )
  end

  def about
  end

  def see_your
    @meet = Meet.all.order( 'date DESC' )
  end

  def new
    @agenda = Agenda.new
    @meetid  = params[:id]
    @meet = Meet.find(params[:id])
    @provide_agenda= Agenda.where("user_id = ? and meet_id = ? ", current_user.id , @meetid ) 
  end

  def delete
    @agenda.destroy 
    respond_to do |format|
      format.html { redirect_to home_new_path( :id => @agenda.meet_id ) , notice: "Agenda was successfully destroyed." }
    end
  end


  private 
  def set_meet
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.require(:agenda).permit(:user_id , :content , :meet_id )
  end
end
