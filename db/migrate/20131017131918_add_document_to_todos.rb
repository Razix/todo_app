class AddDocumentToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :document, :string
  end
end
