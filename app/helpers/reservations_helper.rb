module ReservationsHelper

    def correct_reserve_period
         #@spaceから特定のspaceに関する予約情報を見る
        if  @space.id.present?
        #予約がある場合はstart_dateとend_dateを呼び出す
            old_start_date = @space.start_date
            old_end_date = @space.end_date
        #新しい予約の@reservationのstart_dateとend_date期間がかぶるかどうかチェック(true or false)
            start_date = @reservation.start_date
            end_date = @reservation.end_date
        #p =( <= AND =>)期間の判別
            #p = old_start_date <= end_date AND old_end_date >= start_date
            return p
        else

        end
    end
end