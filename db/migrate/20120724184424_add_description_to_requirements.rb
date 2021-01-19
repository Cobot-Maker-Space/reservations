class AddDescriptionToRequirements < ActiveRecord::Migration[4.2]
  def change
    add_column :requirements, :description, :string
  end
end
