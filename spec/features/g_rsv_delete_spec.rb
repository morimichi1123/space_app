require 'rails_helper'

RSpec.feature "page_move", type: :feature do

  #before do
  #  @user = FactoryBot.create(:user)
  #  @space = FactoryBot.create(:space)
  #  @reservation = FactoryBot.create(:reservation, user_id: @user.id, space_id: @space.id)
  #end

    feature "general予約関連" do
        before do
            @user = FactoryBot.create(:user)
            @space = FactoryBot.create(:space)
            @reservation = FactoryBot.create(:reservation, user_id: @user.id, space_id: @space.id)
          visit signup_path
            fill_in 'Name',         with: 'hoge'
            fill_in 'Email',        with: 'hoge@hoge.com'
            fill_in 'Password',     with: 'hogehoge'
            fill_in 'Confirmation', with: 'hogehoge'
            click_button 'Create my account'
          visit index_path
        end

        it "予約詳細からキャンセルできること[109]" do
          visit reservation_path(@reservation.id)
          click_link 'delete'
          expect(page).to have_content 'canceled'
        end

        #↓要改善。予約検索。！！！！
        it "予約listから検索できること[]" do
            expect(page).to have_content "Search"
              @reservation = Reservation.create!(start_date: "2019/12/22", end_date: "2019/12/24", user_id: @user.id, space_id: @space.id)
              @reservation = Reservation.last
              #@reservation.reload
              #@reservation = FactoryBot.create(:reservation(id: 4), user_id: @user.id, space_id: @space.id)
                fill_in "search",   with: @reservation.id
                click_on 'Search'
                assert_select "td", "#{@reservation.id}"
        end
      end

      #feature "general予約関連" do
      #  before do
      #      @user = FactoryBot.create(:user)
      #      @space = FactoryBot.create(:space)
      #      @reservation = FactoryBot.create(:reservation, user_id: @user.id, space_id: @space.id)
      #    visit signup_path
      #      fill_in 'Name',         with: 'hoge'
      #      fill_in 'Email',        with: 'hoge@hoge.com'
      #      fill_in 'Password',     with: 'hogehoge'
      #      fill_in 'Confirmation', with: 'hogehoge'
      #      click_button 'Create my account'
      #    visit index_path
      #    visit reservation_path(@reservation.id)
      #    click_link 'delete'
      #  end
#
      #  it "予約詳細からキャンセルできること[108]" do
      #    expect(page).to have_content 'canceled'
      #  end
      #end
end