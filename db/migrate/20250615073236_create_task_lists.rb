class CreateTaskLists < ActiveRecord::Migration[7.2]
  def change
    create_table :task_lists do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :task_lists, :title, unique: true
  end
end
