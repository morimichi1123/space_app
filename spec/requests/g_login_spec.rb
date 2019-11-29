require 'rails_helper'

RSpec.feature "general_login", type: :request do

      before do
        @user = FactoryBot.create(:user)
      end

      it 'generalログインでSearchが表示されること[69]' do
        post signup_path, params: { user: {name: "kai",
                                          email: "kaikai@kai.com",
                                          password: "kaikai",
                                          password_confirmation: "kaikai"}}
        expect(response.status).to eq 302
        follow_redirect!
        expect(response).to render_template "spaces/list"
        expect(response.body).to include "Search"
      end

      it 'generalログインでMypageに遷移できること[103]' do
        post signup_path, params: { user: {name: "kai",
                                          email: "kaikai@kai.com",
                                          password: "kaikai",
                                          password_confirmation: "kaikai"}}
        expect(response.status).to eq 302
        follow_redirect!
        get root_path
        expect(response).to render_template "/"
      end

      it 'generalログインで予約一覧に遷移できること[104],[106]' do
        post signup_path, params: { user: {name: "kai",
                                          email: "kaikai@kai.com",
                                          password: "kaikai",
                                          password_confirmation: "kaikai"}}
        expect(response.status).to eq 302
        follow_redirect!
        get index_path
        expect(response).to render_template "reservations/list"
        expect(response.body).to include "ID Search"
      end

      #要改善↓
      it 'generalログインで情報変更に遷移できること[110]' do
        post signup_path, params: { user: {name: "kai",
                                          email: "kaikai@kai.com",
                                          password: "kaikai",
                                          password_confirmation: "kaikai"}}
        expect(response.status).to eq 302
        follow_redirect!
        get edit_user_path(@user)
        expect(response).to render_template "users/edit"
      end
end