class AddUserToNotebooks < ActiveRecord::Migration
  def change
    add_reference :notebooks, :user, index: true
  end
end
