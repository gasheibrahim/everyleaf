class Task < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :content, presence: true
  validates :priority, presence: true
end
