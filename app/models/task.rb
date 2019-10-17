class Task < ApplicationRecord
  paginates_per 4
  validates :name, presence: true
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :content, presence: true
  validates :priority , presence: true
  def self.search(search)
   if term
     where('name LIKE ?', "%#{search}%")
   else
     order('id desc')
   end
 end
 def self.order_list(sort_order)
   if sort_order == "name"
     order(name: :desc)
   elsif sort_order == "end_date"
     order(end_date: :desc)
   elsif sort_order == "priority"
     order(priority: :desc)
   else
     order(created_at: :desc)
   end
 end
end
