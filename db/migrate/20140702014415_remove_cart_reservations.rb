class RemoveCartReservations < ActiveRecord::Migration[4.2]
  def up
    drop_table :cart_reservations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
