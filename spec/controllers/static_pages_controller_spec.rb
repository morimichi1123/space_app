require 'rails_helper'

RSpec.describe StaticPagesController, type: :request do

  before do
    @user = User.create!(
                 id: 2,
                 name:  "hoge",
                 email: "hoge@hoge.com",
                 password: "hogehoge",
                 password_confirmation: "hogehoge",
                 admin: false
                 )
  end

  describe "GET #home" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

end
