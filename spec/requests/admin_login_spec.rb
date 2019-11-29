require 'rails_helper'

RSpec.feature "admin_login", type: :request do

  #before do
  #  @user = User.create!(
  #               id: 1,
  #               name:  "kori",
  #               email: "kori@kori.com",
  #               password: "morimori",
  #               password_confirmation: "morimori",
  #               admin: 1
  #               )
  #  #click_button 'Log in'
  #  #visit root_path
  #end

 #before do
 #  visit root_path
 #  fill_in 'Email', with: 'kori@kori.com', match: :first
 #  fill_in 'Password', with: 'morimori', match: :first
 #  click_on 'Log in'
 #end

 #feature 'home page' do
 #  it 'homeにContentsの文字が現れる' do
 #    #admin_login
 #    #log_in_as(@user)
 #    #visit root_path
 #    expect(page).to have_content "Search"
 #  end

      before do
        @user = FactoryBot.create(:admin)
      end

      #it '非ログイン時、空いた空間の文字があること' do
      #get root_path
      #  expect(page).to have_content "空いた空間"
      #  expect(page).to have_button 'Log in'
      #end

      it 'adminログインでContentsの文字が現れる' do
        #get root_path
        #fill_in 'Email', with: @user.email, match: :first
        #fill_in 'Password', with:  @user.password, match: :first
        #click_on 'Log in'
        #post signup_path, params: { user: {name: "kori",
        #                                  email: "kori@kori.com",
        #                                  password: "korikori",
        #                                  password_confirmation: "korikori",
        #                                  admin: 1
        #                                  }}
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        expect(response).to render_template "/"
        expect(response.body).to include "Contents"
      end



end