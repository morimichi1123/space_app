require 'rails_helper'

RSpec.describe Reservation, type: :feature do

    before do
        #@user = FactoryBot.create(:user)
        @space = FactoryBot.create(:space)
        #@reservation = FactoryBot.create(:reservation)
        visit signup_path
        fill_in 'Name',         with: 'hoge'
        fill_in 'Email',        with: 'hoge@hoge.com'
        fill_in 'Password',     with: 'hogehoge'
        fill_in 'Confirmation', with: 'hogehoge'
        click_button 'Create my account'
        visit list_path
    end

    it "物件一覧画面から物件詳細に遷移できること" do
        visit space_path(@space.id)
        expect(page).to have_content '年をまたいだ予約'
    end

    it "物件一覧画面から検索できること" do
        @space = Space.create!(
                                space_name: "asakusa",
                                ward_id:  11,
                                price: "5000"
                              )
        fill_in "search",   with: 'asa'
        click_button 'Search'
        expect(page).to have_content 'asa'
    end

    #it "物件一覧画面から物件詳細に遷移できること" do
    #    log_in_as(@user)
    #    visit reservations
    #    get :show, params: { 'id' => @reservation.id }, session: { 'reservation.id' => @reservation.id}
    #    expect(page).to have_content "Detail"
    #end

end
