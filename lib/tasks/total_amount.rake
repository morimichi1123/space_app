namespace :total_amount do

    desc "全予約の金額を合計させる（累計売上）"
    task total: :environment do
      #ここから処理を書いていく
      #定期実行する際に、そのログを取っておくのは大事。ログがないと定期実行でエラーが起きても分からない。
      logger = Logger.new 'log/recover_reservation_life.log'

      #全てのユーザーを取得していく
      #eachを使うと全てのユーザーがメモリに載せられてしまうが、find_eachにすることで1000件ずつ読み込んでメモリに展開される ユーザー数が多いならfind_eachを使った方が安全
      Reservation.find_each do |reservation|
        begin
            #reservationsテーブルのpriceカラムの合計値を求めたい場合
            array = [] #空の配列を用意
            Reservation.all.each do |reservation|
            array << reservations.spaces.price
            #reservationテーブルのレコードを１件ずつ取り出し、priceカラムのデータを配列に入れる
            puts array.sum
          end

        rescue => e
          #何かしらエラーが起きたら、エラーログの書き込み ただし次のユーザーの処理へは進む
          logger.error "reservation_id: #{reservation.id}でエラーが発生"
          logger.error e
          logger.error e.backtrace.join("\n")
          next
        end
      end
    end
end


namespace :sum_sample do
  desc "説明"
  task :reservation_model => :environment do
   # puts Reservation.all.sum(params([:space][:price]))
    puts Reservation.first().space_id
    hoge = Reservation.first().space_id
    puts hoge
    #puts Space.find_each do |n|
    #  n.to_str
    sum = 0
    Space.joins(:reservations).select("reservations.*, spaces.*").each do |reservation|
      sum += reservation.price.to_i
      #puts reservation.price

    #array << reservation.price
  end
    #puts array.sum
    puts sum
  end
end

namespace :task_sample do
    desc "実行処理の説明"
    task :sample do
      puts "Hello World"
    end
end

namespace :task_space_model do
  #desc "task_sample_use_model"
  desc "space_app_development"
  #task :task_model => :environment do
  task :space_model => :environment do
    puts Space.first().to_yaml  #Spaceモデルを参照する！
  end
end