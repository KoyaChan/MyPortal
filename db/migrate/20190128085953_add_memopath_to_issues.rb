class AddMemopathToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :memopath, :string
  end
end
