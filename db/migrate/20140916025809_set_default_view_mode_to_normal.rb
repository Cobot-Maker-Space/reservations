class SetDefaultViewModeToNormal < ActiveRecord::Migration[4.2]
  def change
    change_column :users, :view_mode, :string, :default => 'normal'
  end
end
