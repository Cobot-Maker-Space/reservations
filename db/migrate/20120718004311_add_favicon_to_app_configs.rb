class AddFaviconToAppConfigs < ActiveRecord::Migration[4.2]
  def up
    add_column :app_configs, :favicon_file_name, :string
    add_column :app_configs, :favicon_content_type, :string
    add_column :app_configs, :favicon_file_size, :integer
    add_column :app_configs, :favicon_updated_at, :datetime
  end

  def down
    remove_column :app_configs, :favicon_file_name
    remove_column :app_configs, :favicon_content_type
    remove_column :app_configs, :favicon_file_size
    remove_column :app_configs, :favicon_updated_at
  end
end
