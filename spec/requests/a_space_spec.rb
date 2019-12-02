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
      it '物件詳細画面から物件編集に遷移できること[89]' do
        post login_path, params: { user: {
                                   email: "mori@mori.com",
                                   password: "morimori"}}
        get edit_space_path(@space)
        expect(response).to have_http_status :success
        expect(response).to render_template "spaces/edit"
        beforeで一個保存
         @space.nameが
         #~updateで名前を変えるメソッドでその名前をafterで検証名前の違い
      end
end
