class Name < ApplicationRecord
  validates :baby_name, presence: true
  validates :crossed_out, presence: true
  belongs_to :list
end
