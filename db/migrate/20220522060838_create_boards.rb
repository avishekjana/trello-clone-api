class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.belongs_to :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
