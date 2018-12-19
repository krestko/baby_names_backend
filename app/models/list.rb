class List < ApplicationRecord
  validates :list_name, presence: true
  has_many :names
end
