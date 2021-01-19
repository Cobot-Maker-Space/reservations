class RenameLoginToUsernameForUsers < ActiveRecord::Migration[4.2]
  def change
    rename_column :users, :login, :username
  end
end
