require 'rails_helper'

RSpec.describe SpacesController, type: :feature do

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

  describe "GET #new" do
    it "returns http success" do
      #debugger
      get new_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
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

  describe "GET #space_params" do
    it "returns http success" do
      get :space_params
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #list" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
