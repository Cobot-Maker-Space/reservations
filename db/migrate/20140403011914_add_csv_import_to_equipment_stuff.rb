class AddCsvImportToEquipmentStuff < ActiveRecord::Migration[4.2]
  def change
  	add_column :categories, :csv_import, :boolean, :default => false, :null => false
  	add_column :equipment_models, :csv_import, :boolean, :default => false, :null => false
  	add_column :equipment_objects, :csv_import, :boolean, :default => false, :null => false
  end
end
