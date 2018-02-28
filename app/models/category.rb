class Category < ApplicationRecord
    has_many :phrases
    has_many :words
end
