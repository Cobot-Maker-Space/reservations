class AddSortToCategories < ActiveRecord::Migration[4.2]
  def self.up
    add_column :categories, :sort_order, :integer
  end

  def self.down
    remove_column :categories, :sort_order
  end
end
