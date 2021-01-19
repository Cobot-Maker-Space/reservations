class AddTosAcceptedToUser < ActiveRecord::Migration[4.2]
def self.up
    add_column :users, :terms_of_service_accepted, :boolean
  end

  def self.down
    remove_column :users, :terms_of_service_accepted
  end
end
