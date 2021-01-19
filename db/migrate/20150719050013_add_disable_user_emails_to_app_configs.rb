class AddDisableUserEmailsToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :disable_user_emails, :boolean, default: false
  end
end
