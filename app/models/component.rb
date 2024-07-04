class Component < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :test_cases, dependent: :destroy
  has_many :bugs, dependent: :destroy

end
