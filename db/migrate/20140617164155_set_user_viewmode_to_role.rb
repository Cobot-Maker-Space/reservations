class SetUserViewmodeToRole < ActiveRecord::Migration[4.2]
  def up
    User.connection.execute("update users set view_mode=role")
  end

  def down
  end
end
