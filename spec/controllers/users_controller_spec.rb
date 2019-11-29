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
    #context 'static_pages#home' do
    #before { get root_path }
    #  it 'responds successfully' do
    #    expect(response).to have_http_status 200
    #  end
    #end

    it 'createアクション：302かつ遷移[3]' do
      post signup_path, params: { user: {name:  "mori",
                   email: "mori@mori.com",
                   password: "morimori",
                   password_confirmation: "morimori"} }
      expect(response).to have_http_status 302
      follow_redirect!
      expect(response).to render_template "spaces/list"
      assert_select "div.alert"
    end

    it 'listアクション：302かつ遷移[7]' do
      post login_path, params: { user: {name:  "mori",
                   email: "mori@mori.com",
                   password: "morimori",
                   password_confirmation: "morimori"} }
      get userlist_path
      expect(response).to render_template "users/list"
    end

    #↓要改善
    #it 'destroyアクション：302かつ遷移[4]' do
    #  post login_path, params: { user: {name:  "mori",
    #               email: "mori@mori.com",
    #               password: "morimori",
    #               password_confirmation: "morimori"} }
    #  get users_path
    #  expect(response).to render_template "users/list"
    #end


end
