class ChangeFieldsToDateTimes < ActiveRecord::Migration[6.0]
  def up
    change_column :announcements, :starts_at, :datetime
    change_column :announcements, :ends_at, :datetime
    change_column :reservations, :start_date, :datetime
    change_column :reservations, :due_date, :datetime
  end

  def down
    change_column :announcements, :starts_at, :date
    change_column :announcements, :ends_at, :date
    change_column :reservations, :start_date, :date
    change_column :reservations, :due_date, :date
  end
end
