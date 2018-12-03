class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.integer :number
      t.string :subject
      t.string :logpath
      t.string :salesforce_url
      t.string :ftp_url
      t.string :fix

      t.timestamps
    end
  end
end
