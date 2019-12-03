require 'rails_helper'

RSpec.feature "admin_login", type: :request do

      before do
        @user = FactoryBot.create(:admin)
        @space = FactoryBot.create(:space)
      end

      it 'adminログインでContentsの文字が現れる' do
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

      it 'ログインしたら物件操作画面に遷移できること[83]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        expect(response).to render_template "/"
        get menu_path
        expect(response).to render_template "spaces/menu"
      end

      it '物件一覧画面から検索できること[87]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        expect(response).to render_template "/"
        get menu_path
        @space = FactoryBot.create(:space)
        get show_path, params: { id: @space.id }
        expect(response).to render_template "spaces/show"
      end

      #requestならserchを押す動作。searchできることの確認
      it '物件一覧画面から検索できること[88]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        get list_path
            @space = Space.create!(
                                    space_name: "asakusa",
                                    ward_id:  11,
                                    price: "5000"
                                  )
            expect(response).to render_template "spaces/list"
            expect(response.body).to include "search"
      end
end

#featureならadminのloginができればOK　→adminのloginがfeatureでできれば良い
#RSpec.feature "admin_login", type: :feature do
    #before do
    #    @space = FactoryBot.create(:space)
    #    visit root_path
    #    fill_in 'Email',        with: 'mori@mori.com', match: :first
    #    fill_in 'Password',     with: 'morimori', match: :first
    #    click_button 'Log in'
    #end

    #↓きっしーのadminログイン
  #  feature ' Admin User' do
  #      before do
  #          @user = FactoryBot.create(:user, admin:true)
  #      end
#
#
  #      feature "ログインした後の挙動テスト" do
#
  #          before do
  #            visit root_path
  #            fill_in "Email", with: @user.email, match: :first
  #            fill_in "Password", with: @user.password, match: :first
  #            click_button "Log in"
  #          end
#
  #           it 'ログイン成功した場合' do
  #              expect(current_path).to eq root_path
#
  #              expect(page).to have_content "contents"
  #          end
  #      end
  #  end
#きしここまで

   #it '物件一覧画面から検索できること[88]' do
#  #     log_in(@user)
#  #     @user= current_use
   #    admin_login
   #    visit menu_path
   #        @space = Space.create!(
   #            space_name: "asakusa",
   #            ward_id:  11,
   #            price: "5000"
   #          )
   #    fill_in "search",   with: 'asa'
   #    click_button 'Search'
   #    expect(page).to have_content 'asa'
   #end
#end
