class Category < ApplicationRecord
  belongs_to :phrase, polymorphic: true
end
