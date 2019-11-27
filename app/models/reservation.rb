class Reservation < ApplicationRecord
  validates :start_date, presence: true, date: true
  validates :end_date, presence: true, date: true
  validate :date_cannot_be_in_the_past
 #validate :start_date_cannot_be_smaller_end_date
  validate :start_end_check

 def start_end_check
   if self.start_date.present? && self.end_date.present?
    errors.add(:end_date, "の日付を正しく記入してください。") unless
    self.start_date < self.end_date
   else
    return false
   end
 end

def date_cannot_be_in_the_past
  if start_date.present? && start_date < Date.today
    errors.add(:date, ": 過去の日付は使用できません")
  end
end

#def start_date_cannot_be_smaller_end_date
#  if start_date.present?
#    start_date >= end_date
#    errors.add(:date, ": 過去の日付は使用できません")
#  end
#end


  belongs_to :user
  belongs_to :space

  def user
    return User.find_by(id: self.user_id)
  end
  #これいる？


  def self.search(search) #ここでのself.はReservations. を意味する
    if search
        where(['id LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
        all #全て表示。Reservation. は省略
    end
  end
end
