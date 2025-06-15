class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.integer :priority
      t.references :task_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
