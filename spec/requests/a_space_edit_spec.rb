require 'rails_helper'

RSpec.describe "space_create", type: :request do

    before do
      #ActionMailer::Base.deliveries.clear
      @space = FactoryBot.create(:space)
      @user = FactoryBot.create(:admin)
      @file = fixture_file_upload("スクリーンショット_2019-11-22_20.36.08.png", true)
    end

    #[113]と重複している
    it "registration success with valid information" do
              post login_path, params: { user: {
                                            email: "mori@mori.com",
                                            password: "morimori"
                                            }
                                    }
          expect(response.status).to eq 302
          follow_redirect!
      count = Space.count
      post spaces_path, params: { space: {space_name: "asakusa",
                                          ward_id: 3,
                                          price: 5000,
                                          picture: @file } }
      expect(count).not_to eq Space.count
      follow_redirect!
      expect(response).to render_template "spaces/list"
    end

    #featureのuserのupdate
    #it "ログインユーザーは情報変更するとUpdatedが表示されること[110]" do
    #  # puts @user.inspect
    #  # puts "/users/#{@user.id}/edit"
    #  visit "/users/#{@user.id}/edit"
    #  expect(page).to have_content 'Name'
    #  fill_in 'Name',         with: 'hogee'
    #  fill_in 'Email',        with: 'hoge@hoge.com'
    #  fill_in 'Password',     with: 'hogehoge'
    #  fill_in 'Confirmation', with: 'hogehoge'
    #  click_button 'Update!'
    #  expect(page).to have_content 'Updated'
    #end
    it "adminユーザーが物件編集するとUpdatedが表示される[114]" do
        post login_path, params: { user: {
                                   email: "mori@mori.com",
                                   password: "morimori"}}
        ward_id = 10
        patch space_path(@space), params: {space: {ward_id: ward_id }}
        @space.reload
        follow_redirect!
        expect(response).to render_template "spaces/list"
        expect(response.body).to include "Updated"
      end
end
