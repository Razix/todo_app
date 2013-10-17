class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :document
      t.belongs_to :todo

      t.timestamps
    end
    add_index :documents, :todo_id
  end
end
