class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.find(params[:id])
  end

  def list
    @reservation = Reservation.paginate(page: params[:page]).search(params[:search])
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    #debugger
    if @reservation.save
        flash[:success] = "予約が完了しました"
        redirect_to list_path
      else
        #同じshowページのままエラーはく↓要改善
        #@space = Space.new(space_params)
        #redirect_to show_path
        flash[:danger] = "日付を入力してください"
        render 'reservations/show'
      end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :space_id)
  end

 #def space_params
 #  params.require(:space).permit(:space_name, :ward_id, :price)
 #end
end