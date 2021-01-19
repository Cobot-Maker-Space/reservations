class AddCheckinAndCheckoutProceduresToEquipmentModel < ActiveRecord::Migration[4.2]
  def self.up
    add_column :equipment_models, :checkout_procedures, :string
    add_column :equipment_models, :checkin_procedures, :string
  end

  def self.down
    remove_column :equipment_models, :checkin_procedures
    remove_column :equipment_models, :checkout_procedures
  end
end
