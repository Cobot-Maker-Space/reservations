class AddDeleteMissedReservationsToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :delete_missed_reservations, :boolean, default: true
  end
end
