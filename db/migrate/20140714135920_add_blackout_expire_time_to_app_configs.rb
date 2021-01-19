class AddBlackoutExpireTimeToAppConfigs < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :blackout_exp_time, :integer
  end
end
