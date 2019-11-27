require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

  before do
    @user = User.new(name:  "hoge",
                 email: "hoge@hoge.com",
                 password: "hogehoge",
                 password_confirmation: "hogehoge",
                )
  end


  describe "GET #create" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template "users/new"
    end
  end

end
