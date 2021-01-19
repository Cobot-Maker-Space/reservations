class DefaultNotesUnsentToFalse < ActiveRecord::Migration[4.2]
  def change
    change_column :reservations, :notes_unsent, :boolean, :default => false
  end
end
