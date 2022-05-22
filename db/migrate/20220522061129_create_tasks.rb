class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.belongs_to :board, null: false, foreign_key: true
      t.integer :state
      t.date :due_date
      t.integer :member_id

      t.timestamps
    end
  end
end
