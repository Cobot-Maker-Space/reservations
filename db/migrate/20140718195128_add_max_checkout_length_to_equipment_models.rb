class AddMaxCheckoutLengthToEquipmentModels < ActiveRecord::Migration[4.2]
  def change
    add_column :equipment_models, :max_checkout_length, :integer
  end
end
