require 'rails_helper'

RSpec.describe UsersController, type: :request do

  before do
    @user = User.create!(
                 id: 2,
                 name:  "hoge",
                 email: "hoge@hoge.com",
                 password: "hogehoge",
                 password_confirmation: "hogehoge"
                 )
  end


  describe "GET #new" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template "users/new"
    end
  end

    it "returns http success" do
      log_in_as(@user)
      get user_path(@user)
      expect(response).to have_http_status :success
      expect(response).to render_template "users/show"
    end



  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
