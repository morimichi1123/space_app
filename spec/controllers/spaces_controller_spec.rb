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
  end

  #describe "GET #new" do
  #  it "returns http success" do
  #    get new_path
  #    expect(response).to have_http_status(:success)
  #  end
  #end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  #要改善↓
  it 'editアクション：302かつ遷移[5]' do
    post login_path, params: { user: {name:  "mori",
                 email: "mori@mori.com",
                 password: "morimori",
                 password_confirmation: "morimori"} }
    get spaces/2/edit_path
    expect(response).to render_template "spaces/edit"
  end

  describe "GET #update" do
    it "returns http success" do
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
