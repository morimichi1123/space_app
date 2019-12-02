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

  describe "GET #edit" do
    it "returns http success[16]" do
          post login_path, params: { user: {name:  "mori",
                 email: "mori@mori.com",
                 password: "morimori",
                 password_confirmation: "morimori"} }
      get edit_space_path(@space)
      expect(response).to have_http_status(:success)
    end
  end

  #↓要改善
  describe "GET #update" do
    it "returns http success[17]" do
          post login_path, params: { user: {name:  "mori",
                 email: "mori@mori.com",
                 password: "morimori",
                 password_confirmation: "morimori"} }
    space = FactoryBot.create(:space)
    patch :update, id: space, space: attributes_for(:space)
    expect(response).to have_http_status(:success)
    #expect(response).to redirect_to spaces_path
    end
  end

    #↓要改善
  describe "GET #create" do
    it "returns http success[14]" do
                post login_path, params: { user: {name:  "mori",
                 email: "mori@mori.com",
                 password: "morimori",
                 password_confirmation: "morimori"} }

      get create_space_path(@space)
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
