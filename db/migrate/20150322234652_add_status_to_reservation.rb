class AddStatusToReservation < ActiveRecord::Migration[4.2]
  def change
    add_column :reservations, :status, :integer, default: 0
  end
end
