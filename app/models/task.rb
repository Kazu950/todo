class Task < ApplicationRecord
    validates :name, presence: true
    validates :priority, presence: true


    def self.search(search)
        if search
          Task.where(['name LIKE ?', "%#{search}%"])
        else
          Task.all
        end
      end
end
