class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :registration_date, presence: true
  validates :status, presence: true
end
