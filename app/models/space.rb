class Space < ApplicationRecord
    validates :space, presence: true, length:{maximum:50}
    validates :ward_id, presence: true, length:{maximum:2}
    validates :price, presence: true, length:{maximum:50}

    def self.search(search) #ここでのself.はBooks. を意味する
        if search
            where(['space_name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
        else
            all #全て表示。Space. は省略
        end
    end
end
