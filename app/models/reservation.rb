class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user
  belongs_to :space

  def user
    return User.find_by(id: self.user_id)
  end

  def self.search(search) #ここでのself.はReservations. を意味する
    if search
        where(['id LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
        all #全て表示。Reservation. は省略
    end
  end
end
