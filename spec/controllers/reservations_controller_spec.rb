require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

  before do
    @user = User.new(name:  "hoge",
                 email: "hoge@hoge.com",
                 password: "hogehoge",
                 password_confirmation: "hogehoge",
                )

    @space = Space.new(
                       ward_id: 2,
                       price: 5000
                      )

    @reservation = Reservation.new(
                        id: 1,
                        user_id: 2,
                        space_id: 1,
                        start_date: "2019-11-29 05:16:02",
                        end_date: "2019-11-30 05:16:02"
                       )
  end

  #it "newアクション：reservation/newへのリクエストが正しく返ってくること" do
  #  get :new
  #  expect(response).to be_success
  #  expect(response).to render_template "reservations/new"
  #end

  it "showアクション：reserve/showへのリクエストが正しく返ってくること	" do
    debugger
    get :show, params: { 'id' => @reservation.id }, session: { 'reservation.id' => @reservation.id}
    expect(response).to be_success
    expect(response).to render_template "reservations/show"
  end

  it "createアクション：Successが表示されること" do
  end

  it "destroyアクション：cancelが表示されること" do
  end

  it "updateリクエスト：遷移のリクエストが200であること" do
  end

  it "listリクエスト：遷移のリクエストが200であること" do
  end





  #元データ
  #describe "GET #create" do
  #  it "returns http success" do
  #   do end get signup_path
  #    expect(response).to have_http_status(:success)
  #    expect(response).to render_template "users/new"
  #  end
  #end

end
