class Genre < ApplicationRecord
    validates :id, presence: true, if: :exist?
    validates :genre_id, numericality: { only_integer: true }

    def exist?
        Genre.where(genre_id: -1).nil?
    end
end
