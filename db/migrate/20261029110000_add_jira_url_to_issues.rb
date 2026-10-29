class AddJiraUrlToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :jira_url, :string
  end
end
