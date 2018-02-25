class Word < ApplicationRecord
    has_many :sentences, dependent: :destroy
    validates :english, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 0, maximum: 25 }
    validates :single, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 0, maximum: 40 }
end
