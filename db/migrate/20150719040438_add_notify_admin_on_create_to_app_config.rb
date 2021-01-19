class AddNotifyAdminOnCreateToAppConfig < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :notify_admin_on_create, :boolean, default: false
  end
end
