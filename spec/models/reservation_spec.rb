require 'rails_helper'

RSpec.describe Reservation, type: :model do

    describe 'validate of reserve information' do
        it { is_expected.to validate_presence_of :user_id }
        #it { is_expected.to validate_length_of(:user_id).is_at_most(50) }
        it { is_expected.to validate_presence_of :space_id }
        #it { is_expected.to validate_length_of(:space_id).is_at_most(50) }
        it { is_expected.to validate_presence_of :start_date }
        #it { is_expected.to validate_length_of(:start_date).is_at_most(50) }
        it { is_expected.to validate_presence_of :end_date}
        #it { is_expected.to validate_length_of(:end_date).is_at_most(50) }
    end

    it "space_nameが空白だと「invalid」であること" do
    end

    it "space_nameが49文字では「valid」であること" do
    end

    it "space_nameが50文字では「valid」がであること" do
    end

    it "space_nameが51文字では「invalid」がであること" do
    end

    it "space_idが空白だと「error」が表示されること" do
    end

    it "space_idが49文字では「登録完了」が表示されること" do
    end

    it "space_idが50文字では「登録完了」が表示されること" do
    end

    it "space_idが51文字では「登録未完了」が表示されること" do
    end

    it "reserve_idが空白でないこと" do
    end

    it "reserve_idが1文字では「登録完了」が表示されること" do
    end

    it "reserve_idが2文字では「登録完了」が表示されること" do
    end

    it "reserve_idが3文字では「登録未完了」が表示されること" do
    end

    it "入力された型が日付型でないと「予約未完了」が表示されること" do
    end

    it "過去の日付を入力すると「予約未完了」が表示されること" do
    end

    it "未来の日付を入力すると「予約完了」が表示されること" do
    end

    it "予約期間が重複していなければ「予約完了」が表示されること" do
    end

    it "予約開始日が重複していると「予約未完了」が表示されること" do
    end

    it "予約終了日が重複していると「予約未完了」が表示されること" do
    end

    it "予約期間が重複（内包）していると「予約未完了」が表示されること" do
    end

    it "start_dateが空白でないこと" do
    end

    it "end_dateが空白でないこと" do
    end
end
