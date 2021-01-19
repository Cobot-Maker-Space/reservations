class AddEquipmentObjectsCountToEquipmentModels < ActiveRecord::Migration[4.2]
  def change
    add_column :equipment_models, :equipment_objects_count, :integer, default: 0, null: false
  end
end
