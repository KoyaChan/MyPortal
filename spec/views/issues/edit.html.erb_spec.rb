require 'rails_helper'

describe 'issues/edit', type: feature do
  feature 'Issueの編集' do
    before(:each) do
      @issue = create(:valid_issue)
    end

    scenario 'Issueを有効な内容で編集' do
      visit issues_path
      expect(page).to have_content('編集')

      click_link '編集'

      expect(page).to have_field 'issue[number]', with: @issue.number.to_i.to_s
      expect(page).to have_field 'issue[subject]', with: @issue.subject

      new_subject = '実際にはクラッシュではなくハング'
      fill_in 'issue[subject]', with: new_subject

      click_button '登録'

      expect(page).to have_content(new_subject)
    end

    scenario 'Issueを無効な内容で編集' do
      visit issues_path
      expect(page).to have_content('編集')

      click_link '編集'

      expect(page).to have_field 'issue[number]', with: @issue.number.to_i.to_s
      expect(page).to have_field 'issue[subject]', with: @issue.subject

      new_invalid_number = '20000'
      fill_in 'issue[number]', with: new_invalid_number

      click_button '登録'
      expect(page).to have_field 'issue[number]'
      expect(@issue.errors.count).to eq(1)
    end
  end
end
