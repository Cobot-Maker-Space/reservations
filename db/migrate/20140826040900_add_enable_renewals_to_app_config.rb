class AddEnableRenewalsToAppConfig < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :enable_renewals, :boolean, default: true
  end
end
