require 'rails_helper'

RSpec.describe IssuesController, type: :controller do

  describe 'Issueの追加' do
    it 'Issue番号をセットして登録画面へリダイレクトする' do
      post :search, params: { number: '123456' }
      expect(response).to redirect_to(new_issue_path(number: '123456'))
    end

    it '既存のissueが見つかったら、それを登録画面に表示する' do
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
