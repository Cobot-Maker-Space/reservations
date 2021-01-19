class AddNotesToReservationTable < ActiveRecord::Migration[4.2]
  def self.up
    add_column :reservations, :notes, :text
  end

  def self.down
    remove_column :reservations, :notes
  end
end
