module ReservationsHelper

    def correct_reserve_period?(reservation)
        #debugger
        start_date = reservation.start_date
        end_date = reservation.end_date
        return unless start_date.present? && end_date.present?

        @old_reservations = Reservation.where(space_id: params[:reservation][:space_id]).where("start_date <= ?", end_date).where("end_date >= ?", start_date)

        return @old_reservations.present?
    end


end