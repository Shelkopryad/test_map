class AddLinkToBug < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :jira_link, :string
  end
end
