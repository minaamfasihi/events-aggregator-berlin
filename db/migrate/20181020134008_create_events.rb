class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :title
      t.text :details
      t.date :event_date, index: true
      t.references :web_source, foreign_key: true, index: true

      t.timestamps
    end
  end
end
