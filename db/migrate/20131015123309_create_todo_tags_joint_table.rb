class CreateTodoTagsJointTable < ActiveRecord::Migration
  def change
    create_table :tags_todos, id: false do |t|
      t.integer :todo_id
      t.integer :tag_id
    end

    add_index :tags_todos, [:todo_id, :tag_id]
  end
end
