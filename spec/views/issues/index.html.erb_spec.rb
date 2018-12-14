require 'rails_helper'

describe 'issues/index', type: :feature do
  feature 'Issueリストの表示' do
    before(:each) do
      @issue = create(:valid_issue)
    end

    scenario 'リストにIssueが表示される' do
      visit issues_path
      expect(page).to have_content(@issue.number)
      expect(page).to have_content(@issue.subject)
    end
  end
end
