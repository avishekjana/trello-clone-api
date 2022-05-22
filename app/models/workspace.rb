class Workspace < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :member_workspaces
  has_many :members, through: :member_workspaces
  has_many :boards
end
