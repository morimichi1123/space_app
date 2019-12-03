require 'rails_helper'

RSpec.feature "admin_login", type: :feature do

end
feature ' Admin User' do
    #before do
    #    @user = FactoryBot.create(:admin)
    #end

    feature 'adminユーザーのユーザ検索テスト' do
        before do
          visit login_path
          fill_in "Email", with: "mori@mori.com"
          fill_in "Password", with: "morimori"
          click_button "Log in"
          visit root_path
        end

        it 'root_pathに遷移できること' do
            expect(current_path).to eq root_path
        #visit root_path
        end

        it 'userlistからにユーザーを検索できること' do
            visit userlist_path
            #expect(current_path).to eq root_path
            expect(page).to have_content "Search"
                @user = User.create!(name: "asakusa", email: "asa@asa.com", password: "asakusaman")
            fill_in "search",   with: 'asak'
            click_button 'Search'
            expect(page).to have_content 'asak'
        end

    end
end
