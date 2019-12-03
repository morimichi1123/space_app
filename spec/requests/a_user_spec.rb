require 'rails_helper'

RSpec.describe Reservation, type: :request do

    before do
         @g_user = User.create!(
             id: 3,
             name:  "aori",
             email: "aori@aori.com",
             password: "aoriaori",
             password_confirmation: "aoriaori",
             admin: false
             )
        @user = FactoryBot.create(:admin)
      end

    it 'ユーザ一覧画面からユーザ詳細に遷移できること[93]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        get "/users/#{@user.id}"
        expect(response).to render_template "users/show"
    end

    it 'ユーザ詳細からユーザを削除できること[94]' do
        post login_path, params: { user: {
                                   email: "mori@mori.com",
                                   password: "morimori"}}

        get "/users/#{@g_user.id}"
        expect(response).to render_template "users/show"
            count = User.count
            delete user_path(@g_user)
            expect(count).not_to eq User.count
        follow_redirect!
        expect(response).to render_template "users/list"
    end

    it 'ユーザ一覧からユーザを検索できること[95]' do
        post login_path, params: { user: {
                                   email: "mori@mori.com",
                                   password: "morimori"}}

        get userlist_path, params: {name: "aori"}
        expect(response).to render_template "users/list"
        expect(response.body).to include "aori"
    end
end
