class AddSlugToWorkspaces < ActiveRecord::Migration[6.1]
  def change
    add_column :workspaces, :slug, :string
    add_index :workspaces, :slug, unique: true
  end
end
