class ReservationsController < ApplicationController
  before_action :logged_in_user

  def new
    @reservation = Reservation.new
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def list
    @reservation = current_user.reservations.paginate(page: params[:page]).search(params[:search])
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    #debugger
    #@reservation = Reservation.new(reservation_params user_id: @current_user.id)
    if @reservation.save
        flash[:success] = "予約が完了しました"
        redirect_to list_path
      else
        #同じshowページのままエラーはく↓要改善
        #@space = Space.new(space_params)
        #redirect_to show_path
        flash[:danger] = "日付を入力してください"
        render 'spaces/show'
      end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :space_id, :start_date, :end_date)
    end

 #def space_params
 #  params.require(:space).permit(:space_name, :ward_id, :price)
 #end
end