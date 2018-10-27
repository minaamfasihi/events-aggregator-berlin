class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_url, :text
    add_column :events, :img_url, :text
    add_column :events, :category, :string
    add_column :events, :subtitle, :string
  end
end
