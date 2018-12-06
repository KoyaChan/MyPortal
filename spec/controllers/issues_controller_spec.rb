require 'rails_helper'

RSpec.describe IssuesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      pending
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end


describe IssuesController, type: :feature do
  feature 'Issueの登録' do
    scenario '有効なissueを登録' do
      number_to_input = '20000'
      subject_to_input = 'バックアップデータについて'

      visit new_issue_url
      expect(page).to have_content('Issue番号')
      fill_in 'Issue番号', with: number_to_input
      fill_in '件名', with: subject_to_input

      expect { click_button '登録' }.to change { Issue.count }.by(1)

      expect(page).to have_content(subject_to_input)
    end
  end
end
