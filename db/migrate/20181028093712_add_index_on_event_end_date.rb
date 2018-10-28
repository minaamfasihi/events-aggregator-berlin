class AddIndexOnEventEndDate < ActiveRecord::Migration[5.2]
  def change
    add_index :events, :event_end_date
  end
end
