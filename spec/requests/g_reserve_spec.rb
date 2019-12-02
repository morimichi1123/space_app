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

    it "物件一覧画面から物件詳細に遷移できること[101],[103]" do
        visit space_path(@space.id)
        expect(page).to have_content '年をまたいだ予約'
        expect(page).not_to have_content 'edit'
    end

    it "物件一覧画面から検索できること[102]" do
        @space = Space.create!(
                                space_name: "asakusa",
                                ward_id:  11,
                                price: "5000"
                              )
        fill_in "search",   with: 'asa'
        click_button 'Search'
        expect(page).to have_content 'asa'
    end

    #g_loginにてDONE
    #it "予約一覧画面から予約詳細に遷移できること[108]" do
    #    #@reservation = Reservation.create!(
    #    #                                    user_id: 3,
    #    #                                    space_id:  1,
    #    #                                    start_date: "2019-12-20 05:16:02",
    #    #                                    end_date: "2019-12-30 05:16:02"
    #    #                                  )
    #    @reservation = FactoryBot.build(:reservation)
    #    #外部キーなので作れませんらしい
    #    @reservation.save
    #    visit reservations
    #    get :show, params: { 'id' => @reservation.id }
    #    expect(page).to have_content "Detail"
    #end

end
