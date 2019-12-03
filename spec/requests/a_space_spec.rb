require 'rails_helper'

RSpec.describe Reservation, type: :request do

    before do
        @space = FactoryBot.create(:space)
        @space1 = FactoryBot.create(:space)
        @user = FactoryBot.create(:admin)
      end

    it '物件詳細から物件を削除できること[91]' do
        post login_path, params: { user: {
                                   email: "mori@mori.com",
                                   password: "morimori"}}

        get "/spaces/#{@space.id}"
        expect(response).to render_template "spaces/show"
            count = Space.count
            delete space_path(@space)
            #space消したふり
            expect(count).to eq Space.count
            #expect(@space.exist).to eq 1
            follow_redirect!
            expect(response.body).to include "deleted"
            expect(response).to render_template "spaces/list"
      end

      it '物件詳細画面から物件編集に遷移できること[89]' do
        post login_path, params: { user: {
                                   email: "mori@mori.com",
                                   password: "morimori"}}
        get edit_space_path(@space)
        expect(response).to have_http_status :success
        expect(response).to render_template "spaces/edit"
      end

      #↓要改善
      #it '物件編集からupdateしたらUpdatedが表示されること[89]' do
      #  post login_path, params: { user: {
      #                             email: "mori@mori.com",
      #                             password: "morimori"}}
      #  get edit_space_path(@space)
      #  #@space.update, params: { space: {space_name: a, ward_id: 22, price: 3422}}
      #  #@space.nameが
      #  #~updateで名前を変えるメソッドでその名前をafterで検証名前の違い
      #end

      it 'ログインしたら物件追加画面に遷移できること[111]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        expect(response).to render_template "/"
        get new_path
        expect(response).to render_template "spaces/new"
      end

      it '物件追加画面から追加したらSuccessが表示されること[113]' do
        post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
        get new_path
        count = Space.count
        space2 = FactoryBot.create(:space)
        create space_path(space2)
        expect(count).not_to eq Space.count
        expect(response).to render_template "spaces/list"
        expect(response.body).to include "Success"
      end
end
