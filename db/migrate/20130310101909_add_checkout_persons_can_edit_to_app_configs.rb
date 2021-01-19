class AddCheckoutPersonsCanEditToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :checkout_persons_can_edit, :boolean, :default => false
  end
end

