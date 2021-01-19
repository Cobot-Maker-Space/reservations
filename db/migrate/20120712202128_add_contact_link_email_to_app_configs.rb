class AddContactLinkEmailToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    remove_column :app_configs, :contact_link_text
  end

end
