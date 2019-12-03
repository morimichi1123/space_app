require 'rails_helper'

RSpec.describe "space_create", type: :request do

  before do
    #ActionMailer::Base.deliveries.clear
    @space = FactoryBot.create(:space)
    @user = FactoryBot.create(:admin)
    @file = fixture_file_upload("スクリーンショット_2019-11-22_20.36.08.png", true)
  end

  it "registration success with valid information" do
            post login_path, params: { user: {
                                          email: "mori@mori.com",
                                          password: "morimori"
                                          }
                                  }
        expect(response.status).to eq 302
        follow_redirect!
    count = Space.count
    post spaces_path, params: { space: {space_name: "asakusa",
                                        ward_id: 3,
                                        price: 5000,
                                        picture: @file } }
    expect(count).not_to eq Space.count
    follow_redirect!
    expect(response).to render_template "spaces/list"
  end

end
