class AddTimesRenewedToReservations < ActiveRecord::Migration[4.2]
  def change
    add_column :reservations, :times_renewed, :integer

  end
end
