class CleanUpCheckInOutProcedures < ActiveRecord::Migration[4.2]
  def change
    remove_column :equipment_models, :checkout_procedures
    remove_column :equipment_models, :checkin_procedures
  end
end
