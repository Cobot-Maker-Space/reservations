class AddEnableNewUsersToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :enable_new_users, :boolean, default: true
  end
end
