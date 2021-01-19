class AddEquipmentReferencesToReservations < ActiveRecord::Migration[4.2]
  def self.up
    change_table :reservations do |t|
      t.references :equipment_model
      t.references :equipment_object
    end
  end

  def self.down
  end
end
