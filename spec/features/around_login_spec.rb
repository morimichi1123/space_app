require 'rails_helper'

RSpec.feature "page_move", type: :feature do

  before do
    @user = User.create!(
                 id: 2,
                 name:  "hoge",
                 email: "hoge@hoge.com",
                 password: "hogehoge",
                 password_confirmation: "hogehoge",
                 admin: false
                 )
  end

  feature 'home page' do
    before do
      visit root_path
    end

    it 'homeにWelcomeの文字が現れる' do
      #debugger
      expect(page).to have_content "空いた空間"
    end

    it 'title' do
      expect(page).to have_title "App"
    end
  end

    feature 'signup page' do
     before do
       visit signup_path
     end

     it 'Sign up文字が現れる' do
       expect(page).to have_content "Sign up"
     end

     it 'title h' do
       expect(page).to have_title "Sign up | Space App"
     end

     it 'ボタンのCreate my accountがある' do
       expect(page).to have_button "Create my account"
     end
    end

    feature 'new createした時の挙動' do
      before do
        visit root_path
        fill_in 'Name',         with: 'hoge'
        fill_in 'Email',     with: 'hogehoge'
        fill_in 'Password',     with: 'hogehoge'
        fill_in 'Confirmation', with: 'hogehoge'
        click_button 'Create my account'
      end

      it 'list_pathに遷移する' do
        expect(current_path).to eq list_path
      end

      it "成功するとメッセージがでる=>Welcome"[76] do
        expect(page).to have_content "Welcome"
      end
    end

    feature 'new createに失敗した時の挙動テスト' do
      before do
        visit root_path
        fill_in 'Name',         with: 'hoge'
        fill_in 'Email',        with: 'test@hoge.com'
        fill_in 'Password',     with: 'hogehoge'
        fill_in 'Confirmation', with: 'fugafuga'
        click_button 'Create my account'
      end

      it 'sign_pathに遷移する' do
        expect(current_path).to eq signup_path
      end


      it "passwordが違うとエラーメッセージがでる" do
        expect(page).to have_content "The form contains 1 error."
        expect(page).to have_content  'doesn\'t match'
      end
    end

  feature "ログイン失敗" do
    before do
      visit root_path
      #@user = FactoryBot.create(:user)
      fill_in 'Email',        with: 'tester1@example.com', match: :first
      fill_in 'Password',     with: 'passwordd', match: :first
      click_on 'Log in'
    end
    it "error message" do
      expect(page).to have_content "Invalid email/password combination"
    end
  end

end