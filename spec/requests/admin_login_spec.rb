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

      it 'adminログインでContentsが表示されること[68]' do
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

      #g_login_spec.rbにて記載
      #it 'generalログインでSearchが表示されること[69]' do
      #  post signup_path, params: { user: {name: "kai",
      #                                    email: "kaikai@kai.com",
      #                                    password: "kaikai",
      #                                    password_confirmation: "kaikai"}}
      #  expect(response.status).to eq 302
      #  follow_redirect!
      #  expect(response).to render_template "spaces/list"
      #  expect(response.body).to include "Search"
      #end

      it 'adminログインでuserlistに遷移できること[92]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        get userlist_path
        expect(response).to render_template "users/list"
      end

      it 'adminログインでmenuに遷移できること[9]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        get menu_path
        expect(response).to render_template "spaces/menu"
      end

      it 'adminログインで物件一覧に遷移できること[84][18]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        get list_path
        expect(response.status).to eq 200
        expect(response).to render_template "spaces/list"
      end

      it 'adminログインで物件追加に遷移できること[85][12]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        get new_path
        expect(response.status).to eq 200
        expect(response).to render_template "spaces/new"
      end

      it 'adminログインで物件詳細に遷移できること[86][13]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        @space =  {id: 1,
                   space_name: "ginza",
                   ward_id: 1,
                   price: 5000}
        #get space_path(@space, id: 10)
        get show_path, params: { id: 1 }
        expect(response).to render_template "spaces/show"
      end

      it 'adminログインで予約一覧に遷移できること[96]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        get index_path
        expect(response).to render_template "reservations/list"
      end
end