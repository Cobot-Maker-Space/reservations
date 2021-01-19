class RemoveDeletedAtFromUsers < ActiveRecord::Migration[4.2]
  def up
    remove_column :users, :deleted_at
  end

  def down
    add_column :users, :deleted_at, :datetime
  end
end
