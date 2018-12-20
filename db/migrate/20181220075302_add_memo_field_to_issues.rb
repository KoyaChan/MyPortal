class AddMemoFieldToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :memo, :string
  end
end
