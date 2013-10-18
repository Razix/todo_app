class RemoveDocumentFromTodos < ActiveRecord::Migration
  def up
    remove_column :todos, :document
  end

  def down
    add_column :todos, :document, :string
  end
end
