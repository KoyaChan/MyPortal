class AddCftNumberToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :cft_number, :integer
    add_index :issues, :cft_number, unique: true
  end
end
