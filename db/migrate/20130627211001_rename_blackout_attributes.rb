class RenameBlackoutAttributes < ActiveRecord::Migration[4.2]
  def change
  	rename_table :black_outs, :blackouts
  	rename_column :blackouts, :black_out_type, :blackout_type
  end
end
