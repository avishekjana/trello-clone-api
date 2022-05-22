class CreateMemberWorkspaces < ActiveRecord::Migration[6.1]
  def change
    create_table :member_workspaces do |t|
      t.belongs_to :member, null: false, foreign_key: true
      t.belongs_to :workspace, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
