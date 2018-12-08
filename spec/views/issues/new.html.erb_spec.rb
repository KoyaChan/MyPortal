require 'rails_helper'

RSpec.describe "issues/new.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe IssuesController, type: :feature do
  feature 'Issueの登録' do
    scenario '有効なissueを登録' do
      number_to_input = '20000'
      subject_to_input = 'バックアップデータについて'

      visit new_issue_url
      expect(page).to have_content('Issue番号')
      fill_in 'issue[number]', with: number_to_input
      fill_in 'issue[subject]', with: subject_to_input

      expect { click_button '登録' }.to change { Issue.count }.by(1)

      # expect(page).to have_content(subject_to_input)
    end
  end
end
