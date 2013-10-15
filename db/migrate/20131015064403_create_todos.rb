class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :value

      t.timestamps
    end
  end
end
