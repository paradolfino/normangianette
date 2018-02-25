class Word < ApplicationRecord
    has_many :phrases, dependent: :destroy
    validates :eng_si, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 0, maximum: 25 }
    validates :nor_si, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 0, maximum: 40 }
end
