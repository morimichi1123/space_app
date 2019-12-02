require 'rails_helper'

RSpec.describe Reservation, type: :feature do

    before do
        #@user= FactoryBot.create(:user)
        visit signup_path
        fill_in 'Name',         with: 'hoge'
        fill_in 'Email',        with: 'hoge@hoge.com'
        fill_in 'Password',     with: 'hogehoge'
        fill_in 'Confirmation', with: 'hogehoge'
        click_button 'Create my account'
        #visit root_path
        # visit signup_path
        # @user = User.create!(
        #                      id: 3,
        #                      name:  "hoge",
        #                      email: "hoge@hoge.com",
        #                      password: "hogehoge",
        #                      password_confirmation: "hogehoge",
        #                      admin: false
        #                      )
        #click_button 'Create my account'
        #session[:user_id] = @user.id
        @user = User.last
    end

    it "ログインユーザーは情報変更するとUpdatedが表示されること[110]" do
        # puts @user.inspect
        # puts "/users/#{@user.id}/edit"
        visit "/users/#{@user.id}/edit"
        expect(page).to have_content 'Name'
        fill_in 'Name',         with: 'hogee'
        fill_in 'Email',        with: 'hoge@hoge.com'
        fill_in 'Password',     with: 'hogehoge'
        fill_in 'Confirmation', with: 'hogehoge'
        click_button 'Update!'
        expect(page).to have_content 'Updated'
    end
end
