class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.string :content
      t.belongs_to :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
