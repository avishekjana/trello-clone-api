class Task < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :board
  has_many :comments
  has_many :checklists
end
