class RemoveDeleteMissedReservationsFromAppConfigs < ActiveRecord::Migration[4.2]
  def change
    remove_column :app_configs, :delete_missed_reservations
  end
end
