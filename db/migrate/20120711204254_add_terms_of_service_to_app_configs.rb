class AddTermsOfServiceToAppConfigs < ActiveRecord::Migration[4.2]
  def self.up
    add_column :app_configs, :terms_of_service, :text
  end

  def self.down
    remove_column :app_configs, :terms_of_service
  end
end
