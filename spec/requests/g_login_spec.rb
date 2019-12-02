require 'rails_helper'

RSpec.feature "general_login", type: :request do

      before do
        @user = FactoryBot.create(:user)
        @space = FactoryBot.create(:space)
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

      it 'generalログインで予約一覧から詳細に遷移できること[107]' do
        post signup_path, params: { user: {name: "kai",
                                          email: "kaikai@kai.com",
                                          password: "kaikai",
                                          password_confirmation: "kaikai"}}
        expect(response.status).to eq 302
        follow_redirect!
        #get index_path
        #follow_redirect!
        #@reservation = Reservation.create!(
        #                                    user_id: 3,
        #                                    space_id:  1,
        #                                    start_date: "2019-12-20 05:16:02",
        #                                    end_date: "2019-12-30 05:16:02"
        #                                  )
        @reservation = FactoryBot.create(:reservation, user_id: @user.id, space_id: @space.id)
        #get show_reservation_path(@reservation)
        get "/reservations/#{@reservation.id}"
        #expect(response).to render_template "reservations/list"
        expect(response.body).to include "Detail"
      end

      it 'generalログインで情報変更に遷移できること[105]' do
        post signup_path, params: { user: {name: "kai",
                                          email: "kai@kai.com",
                                          password: "kaikai",
                                          password_confirmation: "kaikai"}}
        #log_in_as(@user)
        expect(response.status).to eq 302
        follow_redirect!
        get edit_user_path(@user)
        follow_redirect!
        expect(response).to have_http_status :success
        #expect(response).to render_template "users/edit"
        #要改善?↑templateはいらん？
      end
end