class AddEnableGuestsToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :enable_guests, :boolean, default: true
  end
end
