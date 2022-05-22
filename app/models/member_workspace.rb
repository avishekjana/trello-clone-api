class MemberWorkspace < ApplicationRecord
  belongs_to :member
  belongs_to :workspace
end
