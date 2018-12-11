require 'rails_helper'

RSpec.describe "issues/new.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe IssuesController, type: :feature do
  feature 'Issueの登録' do
    def input_issue(number_to_input, subject_to_input, expected_change)
      visit new_issue_url
      expect(page).to have_content('Issue番号')
      fill_in 'issue[number]', with: number_to_input
      fill_in 'issue[subject]', with: subject_to_input
      expect { click_button '登録' }.to change { Issue.count }.by(expected_change)
    end

    scenario '有効なissueを登録' do
      number_to_input = '20001'
      subject_to_input = 'バックアップデータについて'
      expected_change = 1

      input_issue(number_to_input, subject_to_input, expected_change)
      expect(page).to have_content(subject_to_input)
    end

    scenario '無効なissueを登録' do
      number_to_input = '20000'
      subject_to_input = 'バックアップデータについて'
      expected_change = 0

      input_issue(number_to_input, subject_to_input, expected_change)
      expect(page).to have_content('エラー')
    end
  end
end
