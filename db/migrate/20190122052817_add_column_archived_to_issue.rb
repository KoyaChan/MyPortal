class AddColumnArchivedToIssue < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :archived, :boolean
  end
end
