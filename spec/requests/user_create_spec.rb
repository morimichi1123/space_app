require 'rails_helper'
#homeに飛べるかどうかの確認
RSpec.describe 'Access to static_pages', type: :request do
  context 'static_pages#home' do
    before { get root_path }
    it 'responds successfully' do
      expect(response).to have_http_status 200
    end

    end
end

#sign up （新しくユーザーを登録）のページに飛べるか
RSpec.describe 'access to sign up page', type: :request do
  describe 'GET #new' do
    it 'responds successfully' do
      get signup_path
      expect(response).to have_http_status 200
    end
  end

#ユーザー登録時に有効なリクエストと無効なリクエストを送ったときのテスト

    describe 'POST #create' do
        #有効なユーザーの検証
        context 'valid request' do
          #ユーザーが追加される
          it 'adds a user' do
            expect do
              post signup_path, params: { user: attributes_for(:user) }
            end.to change(User, :count).by(1)
          end
          #ユーザーが追加されたときの検証
          context 'create a user' do
            before { post signup_path, params: { user: attributes_for(:user) } }
            subject { response }
            it { is_expected.to redirect_to list_path } #listページにリダイレクトされる
            it { is_expected.to have_http_status 302 } #リダイレクト成功
            #it { is_expect(page).to have_content "Welcome"}
          end
        end

        #無効なリクエスト
        context 'invalid request' do
          #無効なデータを作成
          let(:user_params) do
            attributes_for(:user, name: '',
                                  email: 'user@invalid',
                                  password: '',
                                  password_confirmation: '')
          end

          #ログイン失敗でsignup_path
          it 'does not add a user' do
            expect do
              post signup_path, params: { user: user_params }
            end.to change(User, :count).by(0)
            end
        end
    end
end

RSpec.describe "UsersLogin", type: :request do

  it "sessions/newにアクセスできること[19]" do
    #ログインページにアクセス
    get root_path
    expect(response).to have_http_status(:success)
  end
end

RSpec.describe "UsersLogin[71]~[75]", type: :feature do

  it "nameが空白だとエラーが表示されること" do
      visit signup_path
      fill_in 'Name',         with: ''
      fill_in 'Email',        with: 'hoge@hoge.com'
      fill_in 'Password',     with: 'hogehoge'
      fill_in 'Confirmation', with: 'hogehoge'
      click_button 'Create my account'
      expect(page).to have_content "error"
  end

  it "emailが空白だとエラーが表示されること" do
    visit signup_path
    fill_in 'Name',         with: 'mori'
    fill_in 'Email',        with: ''
    fill_in 'Password',     with: 'hogehoge'
    fill_in 'Confirmation', with: 'hogehoge'
    click_button 'Create my account'
    expect(page).to have_content "error"
  end

  it "passwordが空白だとエラーが表示されること" do
    visit signup_path
    fill_in 'Name',         with: 's'
    fill_in 'Email',        with: 'hoge@hoge.com'
    fill_in 'Password',     with: ''
    fill_in 'Confirmation', with: 'hogehoge'
    click_button 'Create my account'
    expect(page).to have_content "error"
  end

  it "password-configが空白だとエラーが表示されること" do
    visit signup_path
    fill_in 'Name',         with: 'aa'
    fill_in 'Email',        with: 'hoge@hoge.com'
    fill_in 'Password',     with: 'hogehoge'
    fill_in 'Confirmation', with: ''
    click_button 'Create my account'
    expect(page).to have_content "error"
  end

  it "passwordとconfigが不一致だとエラーが表示されること" do
    visit signup_path
    fill_in 'Name',         with: ''
    fill_in 'Email',        with: 'hoge@hoge.com'
    fill_in 'Password',     with: 'hogehoge'
    fill_in 'Confirmation', with: 'hogefoo'
    click_button 'Create my account'
    expect(page).to have_content "error"
  end

end
