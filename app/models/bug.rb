class Bug < ApplicationRecord
  belongs_to :component
  has_and_belongs_to_many :tags
end
