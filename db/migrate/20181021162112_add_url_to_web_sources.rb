class AddUrlToWebSources < ActiveRecord::Migration[5.2]
  def change
    add_column :web_sources, :url, :string
  end
end
