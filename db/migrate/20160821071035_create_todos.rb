class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :remark
      t.boolean :is_finished

      t.timestamps null: false
    end
  end
end
