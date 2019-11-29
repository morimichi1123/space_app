require 'rails_helper'

RSpec.describe UsersController, type: :request do

  before do
    @user = User.create!(
                 id: 2,
                 name:  "hoge",
                 email: "hoge@hoge.com",
                 password: "hogehoge",
                 password_confirmation: "hogehoge",
                 admin: false
                 )
    current_user = @user
  end


    it "newアクション：user/newへのクエストが正しく返ってくること" do
      get signup_path
      # debugger
      expect(response).to have_http_status(:success)
      expect(response).to render_template "users/new"
    end


  #feature 'home page' do
  #  before do
  #    visit root_path
  #  end

    it "showアクション：user/showへのリクエストが正しく返ってくること" do
      get user_path(@user)
      expect(response).to have_http_status :success
      expect(response).to render_template "users/show"
    end
 # end

    #？
    context 'static_pages#home' do
    before { get root_path }
      it 'responds successfully' do
        expect(response).to have_http_status 200
      end
    end

    #it 'createアクション：200かつ遷移' do
    #  get root_path
    #  expect(response).to have_http_status :success
    #  expect(response).to have_http_status 200
    #  expect(response).to render_template "users/create"
    #end


end
