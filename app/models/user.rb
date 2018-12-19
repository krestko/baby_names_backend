class User < ApplicationRecord
  validates :user_name, presence: true
  validates :recently_viewed_list, presence: true
end
