class ChangeCheckinCheckoutProceduresToText < ActiveRecord::Migration[4.2]
  def self.up
    change_column :equipment_models, :checkin_procedures, :text
    change_column :equipment_models, :checkout_procedures, :text
  end

  def self.down
  end
end
