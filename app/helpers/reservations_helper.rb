module ReservationsHelper

    def correct_reserve_period?
        #予約がある場合に重複をチェックするモジュール
         #@spaceから特定のspaceに関する予約情報を見る
         @old_reservation = Reservation.find(params[:reservation][:space_id])

        if  @old_reservation.present? #rsvの中のid
        #予約がある場合はstart_dateとend_dateを呼び出す
            old_start_date = @old_reservation.start_date
            #あるスペースに関する予約の中のstart_date
            old_end_date = @old_reservation.end_date
        #新しい予約の@reservationのstart_dateとend_date期間がかぶるかどうかチェック(true or false)
            start_date = @reservation.start_date
            end_date = @reservation.end_date
           # debugger
        #p =( <= AND =>)期間の判別
            p = old_start_date <= end_date && old_end_date >= start_date
            return p
        else
            return false
        end
    end
end