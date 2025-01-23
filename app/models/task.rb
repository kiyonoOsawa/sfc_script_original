class Task < ApplicationRecord
  has_many :team_users
  belongs_to :user
end
