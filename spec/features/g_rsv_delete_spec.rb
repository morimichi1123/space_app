require 'rails_helper'

RSpec.feature "page_move", type: :feature do

  before do
    @user = FactoryBot.create(:user)
    @space = FactoryBot.create(:space)
    @reservation = FactoryBot.create(:reservation, user_id: @user.id, space_id: @space.id)
  end

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
          visit reservation_path(@reservation.id)
          click_link 'delete'
        end

        it "予約詳細からキャンセルできること[108]" do
          expect(page).to have_content 'canceled'
        end
      end

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
          visit reservation_path(@reservation.id)
          click_link 'delete'
        end

        it "予約詳細からキャンセルできること[108]" do
          expect(page).to have_content 'canceled'
        end
      end
end