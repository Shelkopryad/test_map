class Tag < ApplicationRecord
  has_and_belongs_to_many :components
  has_and_belongs_to_many :test_cases
  has_and_belongs_to_many :bugs

  validates :name, uniqueness: true
end
