class Phrase < ApplicationRecord
    belongs_to :word
    belongs_to :category

    validates :english,
    presence: true,
    length: { minimum: 3, maximum: 150 }
    validates :normansk,
    presence: true,
    length: { minimum: 3, maximum: 150 }
end
