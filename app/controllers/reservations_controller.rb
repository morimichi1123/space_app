class ReservationsController < ApplicationController
  before_action :logged_in_user
  include ReservationsHelper

  #def new
  #  debugger
  #  @reservation = Reservation.new
  #end
  #newメソッドいらなかった！

  def show
    #debugger
    @reservation = Reservation.find(params[:id])
  end

  def list
      @reservation = current_user.reservations.paginate(page: params[:page]).search(params[:search])
  end

  def create
    #@reservation = current_user.reservations.create(reservation_params)
    @reservation = Reservation.new(reservation_params)
    #debugger
    @space = Space.find(params[:reservation][:space_id])
    if !correct_reserve_period?(@reservation)
      if @reservation.save
          flash[:success] = "予約が完了しました"
          redirect_to list_path
      else
          #同じshowページのままエラーはく↓要改善
          flash[:danger] = "予約未完了です。正しいstart/end日付を入力してください。"
          redirect_to list_path
      end
    else
      flash[:danger] = "予約未完了です。日付にエラーがあります。"
      redirect_to list_path
    end
  end

  def destroy
    Reservation.find(params[:id]).destroy
    flash[:success] = "Reservation canceled"

    redirect_to list_path
  end

  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :space_id, :start_date, :end_date)
    end

 #def space_params
 #  params.require(:space).permit(:space_name, :ward_id, :price)
 #end
end