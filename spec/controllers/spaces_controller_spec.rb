require 'rails_helper'

RSpec.describe SpacesController, type: :request do

  before do
    @user = User.create!(
                 id: 1,
                 name:  "mori",
                 email: "mori@mori.com",
                 password: "morimori",
                 password_confirmation: "morimori",
                 admin: true
                 )
    #@space = FactoryBot.create(:space)
    @space = Space.create!(id:1,
                           space_name: "ginza",
                           ward_id: 1,
                           price: 5000)
  end

  #describe "GET #new" do
  #  it "returns http success" do
  #    get new_path
  #    expect(response).to have_http_status(:success)
  #  end
  #end

  #イケてる？↓
  it 'showアクション：space/showへのリクエストが正しく返り遷移すること[13][86]' do
    post login_path, params: { user: {name:  "mori",
                 email: "mori@mori.com",
                 password: "morimori",
                 password_confirmation: "morimori"} }
    get "/spaces/#{@space.id}"
    expect(response).to render_template "spaces/show"
  end

  #要改善？↓
  describe "GET #edit" do
    it "returns http success" do
          post login_path, params: { user: {name:  "mori",
                 email: "mori@mori.com",
                 password: "morimori",
                 password_confirmation: "morimori"} }
      get edit_path, params{ id: @space.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
          post login_path, params: { user: {name:  "mori",
                 email: "mori@mori.com",
                 password: "morimori",
                 password_confirmation: "morimori"} }
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #cerate" do
    it "returns http success" do
      get :cerate
      expect(response).to have_http_status(:success)
    end
  end

  #admin_login_spec.rbに書いてる
  #describe "GET #list" do
  #  it "returns http success" do
  #    get :list
  #    expect(response).to have_http_status(:success)
  #  end
  #end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
