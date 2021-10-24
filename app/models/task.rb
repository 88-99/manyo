class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  # validates :status, presence: true
end
