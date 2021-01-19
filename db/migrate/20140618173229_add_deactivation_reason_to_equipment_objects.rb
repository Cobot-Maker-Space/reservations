class AddDeactivationReasonToEquipmentObjects < ActiveRecord::Migration[4.2]
  def change
    add_column :equipment_objects, :deactivation_reason, :string, default: nil
  end
end
