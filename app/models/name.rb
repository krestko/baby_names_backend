class Name < ApplicationRecord
  validates :baby_name, presence: true
  belongs_to :list
end
