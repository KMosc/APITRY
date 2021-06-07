class Genre < ApplicationRecord
    validates :id, presence: true, if: :exist?
    validates :id, numericality: { only_integer: true }

    def exist?
        Genre.where(id: -1).nil?
    end
end
