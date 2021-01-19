class AddUpcomingCheckoutEmailActiveToAppConfig < ActiveRecord::Migration[4.2]
  def change
    add_column :app_configs, :upcoming_checkout_email_active, :boolean
  end
end
