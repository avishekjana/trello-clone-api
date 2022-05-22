class CreateChecklistItems < ActiveRecord::Migration[6.1]
  def change
    create_table :checklist_items do |t|
      t.string :description
      t.belongs_to :checklist, null: false, foreign_key: true
      t.boolean :is_complete, default: false

      t.timestamps
    end
  end
end
