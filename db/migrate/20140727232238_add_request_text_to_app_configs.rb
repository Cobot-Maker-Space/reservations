class AddRequestTextToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :request_text, :text
  end
end
