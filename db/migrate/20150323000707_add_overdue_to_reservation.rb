class AddOverdueToReservation < ActiveRecord::Migration[4.2]
  def change
    add_column :reservations, :overdue, :boolean, default: false
  end
end
