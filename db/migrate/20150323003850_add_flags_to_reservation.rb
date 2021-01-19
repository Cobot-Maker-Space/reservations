class AddFlagsToReservation < ActiveRecord::Migration[4.2]
  def change
    add_column :reservations, :flags, :integer, default: 1
  end
end
