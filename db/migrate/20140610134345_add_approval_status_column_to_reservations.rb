class AddApprovalStatusColumnToReservations < ActiveRecord::Migration[4.2]
  def change
    add_column :reservations, :approval_status, :string, :default => 'auto'
  end
end
