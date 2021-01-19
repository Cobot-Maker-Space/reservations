class AddDefaultValueToUsersNickname < ActiveRecord::Migration[4.2]
  def up
    User.all.each do |user|
      if user.nickname.nil?
        user.nickname = ''
        user.save!
      end
    end
  	change_column :users, :nickname, :string, :default => '', :null => false
  end

  def down
    change_column :users, :nickname, :string
  end
end
