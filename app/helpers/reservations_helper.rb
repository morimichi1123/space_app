module ReservationsHelper

    def correct_reserve_period?(reservation)
        #予約がある場合に重複をチェックするモジュール
         #@spaceから特定のspaceに関する予約情報を見る
         @old_reservation = Reservation.find_by(space_id: params[:reservation][:space_id])
        # @old_reservation = Reservation.find(space_id: params[:reservation][:space_id])

        #space_idでなく、reservation_idでold_reservationを探してしまってる
        #あるspace_idのreservaion

        if  @old_reservation.present?
        #予約がある場合はstart_dateとend_dateを呼び出す
            old_start_date = @old_reservation.start_date
            #あるスペースに関する予約の中のstart_date
            old_end_date = @old_reservation.end_date
        #新しい予約の@reservationのstart_dateとend_date期間がかぶるかどうかチェック(true or false)
            start_date = reservation.start_date
            end_date = reservation.end_date
           return unless start_date.present? && end_date.present?

           #p =( <= AND =>)期間の判別
            p = start_date <= old_end_date && old_start_date <= end_date
            #q =  end_date <= start_date
            return p
        else
            return false
        end
    end
end