class Genre < ApplicationRecord
    validates :genre_id, presence: true, if: :exist?
    validates :genre_id, numericality: { only_integer: true }

    def exist?
        Genre.exists?(:genre_id)
    end
end
