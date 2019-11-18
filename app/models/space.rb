class Space < ApplicationRecord
    def self.search(search) #ここでのself.はBooks. を意味する
        if search
            where(['space_name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
        else
            all #全て表示。Space. は省略
        end
    end
end
