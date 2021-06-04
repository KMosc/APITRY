class Genre < ApplicationRecord
    validates :id, :presence => true, :if => :exist?
    validates :id, numericality: { only_integer: true }

    def exist?
        Genre.exists?(:genre_id)
    end
end
