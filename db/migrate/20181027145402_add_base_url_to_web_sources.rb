class AddBaseUrlToWebSources < ActiveRecord::Migration[5.2]
  def change
    add_column :web_sources, :base_url, :string
  end
end
