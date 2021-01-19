class AddResExpTimeToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :res_exp_time, :integer
  end
end
