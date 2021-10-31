class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  validates :status, presence: true

  enum status: { 未着手:0, 着手:1, 完了:2 }
  enum priority: { 高:0, 中:1, 低:2 }

  scope :order_tasks, -> { reorder(deadline: :desc) }

  scope :order_priorities, -> { reorder(priority: :asc) }

  scope :search_title, -> (title) {
    where("title LIKE ?", "%#{ title }%")
  }

  scope :search_status, -> (status) {
    where(status: status)
  }

end
