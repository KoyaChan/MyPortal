require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'cft_number' do
    before { Issue.create!(number: 521373, subject: 'test', cft_number: 4567) }

    it 'CFT番号が重複する場合は無効' do
      issue = Issue.new(number: 521374, subject: 'test', cft_number: 4567)
      expect(issue).not_to be_valid
    end

    it 'CFT番号が空の場合は有効' do
      issue = Issue.new(number: 521374, subject: 'test', cft_number: nil)
      expect(issue).to be_valid
    end

    it 'CFT番号からJiraのURLを自動で設定する' do
      issue = Issue.create!(number: 521374, subject: 'test', cft_number: 1234)
      expect(issue.jira_url).to eq('https://arcservecloud.atlassian.net/browse/CFT-1234')
    end

    it 'CFT番号を変更したらJiraのURLも作り直す' do
      issue = Issue.create!(number: 521374, subject: 'test', cft_number: 1234)
      issue.update!(cft_number: 5678)
      expect(issue.jira_url).to eq('https://arcservecloud.atlassian.net/browse/CFT-5678')
    end

    it 'CFT番号を変えずにJiraのURLを手で入力した場合は上書きしない' do
      issue = Issue.create!(number: 521374, subject: 'test', cft_number: 1234)
      issue.update!(jira_url: 'https://example.com/manual')
      expect(issue.jira_url).to eq('https://example.com/manual')
    end
  end
end
