class Checklist < ApplicationRecord
  belongs_to :task
  has_many :checklist_items
end
