class Genre < ApplicationRecord
    validate :id, :if => :exist?
    validates :id, numericality: { only_integer: true }
end
