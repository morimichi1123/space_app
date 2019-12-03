require 'rails_helper'

RSpec.describe Reservation, type: :model do

    describe 'validate of reserve information' do
        #it { is_expected.to validate_presence_of :user_id }
        #it { is_expected.to validate_length_of(:user_id).is_at_most(50) }
        #it { is_expected.to validate_presence_of :space_id }
        #it { is_expected.to validate_length_of(:space_id).is_at_most(50) }
        it { is_expected.to validate_presence_of :start_date }
        it { is_expected.to validate_presence_of :end_date}
    end
end

RSpec.describe Reservation, type: :feature do

    before do
        @user = FactoryBot.create(:user)
        @space = FactoryBot.create(:space)
        visit signup_path
        fill_in 'Name',         with: 'hoge'
        fill_in 'Email',        with: 'hoge@hoge.com'
        fill_in 'Password',     with: 'hogehoge'
        fill_in 'Confirmation', with: 'hogehoge'
        click_button 'Create my account'
        visit list_path
        visit space_path(@space.id)
    end

    it "入力された型が日付型でないと「予約未完了」が表示されること" do
        fill_in '借りたい日',   with: 'hoge'
        fill_in '返す日',     with: '2020/1/3'
        click_button 'この日程で予約する'
        expect(page).to have_content '未完了'
    end

    it "過去の日付を入力すると「予約未完了」が表示されること" do
        fill_in '借りたい日',   with: '2019/1/1'
        fill_in '返す日',     with: '2020/1/3'
        click_button 'この日程で予約する'
        expect(page).to have_content '未完了'
    end

    it "未来の日付を入力すると「予約完了」が表示されること" do
        fill_in '借りたい日',   with: '2020/1/1'
        fill_in '返す日',     with: '2020/1/3'
        click_button 'この日程で予約する'
        expect(page).to have_content '完了しました'
    end

    it "予約期間が重複していなければ「予約完了」が表示されること" do
        fill_in '借りたい日',   with: '2020/1/1'
        fill_in '返す日',     with: '2020/1/3'
        click_button 'この日程で予約する'
        expect(page).to have_content '完了しました'

        visit space_path(@space.id)
        fill_in '借りたい日',   with: '2020/1/4'
        fill_in '返す日',     with: '2020/1/5'
        click_button 'この日程で予約する'
        expect(page).to have_content '完了しました'
    end

    it "予約開始日が重複していると「予約未完了」が表示されること" do
        fill_in '借りたい日',   with: '2020/1/1'
        fill_in '返す日',     with: '2020/1/3'
        click_button 'この日程で予約する'
        expect(page).to have_content '完了しました'

        visit space_path(@space.id)
        fill_in '借りたい日',   with: '2020/1/3'
        fill_in '返す日',     with: '2020/1/5'
        click_button 'この日程で予約する'
        expect(page).to have_content '未完了'
    end

    it "予約終了日が重複していると「予約未完了」が表示されること" do
        fill_in '借りたい日',   with: '2020/1/5'
        fill_in '返す日',     with: '2020/1/6'
        click_button 'この日程で予約する'
        expect(page).to have_content '完了しました'

        visit space_path(@space.id)
        fill_in '借りたい日',   with: '2019/12/30'
        fill_in '返す日',     with: '2020/1/5'
        click_button 'この日程で予約する'
        expect(page).to have_content '未完了'
    end

    it "予約期間が重複（内包）していると「予約未完了」が表示されること" do
        fill_in '借りたい日',   with: '2020/1/1'
        fill_in '返す日',     with: '2020/1/6'
        click_button 'この日程で予約する'
        expect(page).to have_content '完了しました'

        visit space_path(@space.id)
        fill_in '借りたい日',   with: '2020/1/2'
        fill_in '返す日',     with: '2020/1/3'
        click_button 'この日程で予約する'
        expect(page).to have_content '未完了'
    end

end
