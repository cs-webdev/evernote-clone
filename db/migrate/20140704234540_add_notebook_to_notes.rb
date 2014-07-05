class AddNotebookToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :notebook, index: true
  end
end
