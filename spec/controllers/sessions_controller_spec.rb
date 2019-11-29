require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  include SessionsHelper

  before do
    post signup_path, params: { user: {name:  "foo",
                                       email: "foo@foo.com",
                                       password: "foofoo",
                                       password_confirmation: "foofoo" }}
  end

  describe "GET #new[19]" do
    it "returns http success" do
      get new_path
      expect(response.status).to eq 302
      follow_redirect!
      expect(response).to have_http_status(:success)
      expect(response).to render_template "static_pages/home"
    end
  end

  describe "GET #create[20]" do
    it "遷移する先にstatic_pages/homeが使われること" do
      expect(response.status).to eq 302
      follow_redirect!
      expect(response).to render_template "spaces/list"
      session[:user_id]
      expect(is_logged_in?).to be_truthy
    end
  end

  describe "GET #destroy[21]" do
    it "logoutでstatic_pages/homeが使われること" do
      delete logout_path
      expect(is_logged_in?).to be_falsey
      follow_redirect!
      expect(response).to render_template "static_pages/home"
    end
  end
end
