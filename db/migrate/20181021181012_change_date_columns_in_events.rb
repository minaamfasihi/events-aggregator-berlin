class ChangeDateColumnsInEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_end_date, :date
    rename_column :events, :event_date, :event_start_date
  end
end
