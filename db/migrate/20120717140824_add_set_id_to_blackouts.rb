class AddSetIdToBlackouts < ActiveRecord::Migration[4.2]
  def self.up
    add_column :black_outs, :set_id, :integer
  end

  def self.down
    remove_column :black_outs, :set_id
  end
end
