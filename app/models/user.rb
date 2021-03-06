class User < ApplicationRecord
    has_many :reservations, dependent: :destroy

    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,   length:{maximum:255},
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def self.search(search) #ここでのself.はUsers. を意味する
        if search
            where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
        else
            all #全て表示。User. は省略
        end
    end
end
