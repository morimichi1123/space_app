require 'rails_helper'

RSpec.describe User, type: :model do
  #FactoryBotでユーザー情報を@userに登録
  before do
    @user = FactoryBot.build(:user)
  end

  #it { is_expected.to validate_presence_of :name }
  #it { is_expected.to validate_length_of(:name).is_at_most(50) }
  #it { is_expected.to validate_presence_of :email }
  #it { is_expected.to validate_length_of(:email).is_at_most(255) }
  #it { is_expected.to validate_presence_of :password }
  #it { is_expected.to validate_length_of(:password).is_at_least(6) }

  it "invalid user with invalid name" do
    @user.name = ""
    expect(@user).not_to be_valid
  end

  it "invalid user with invalid name" do
    @user.name = "a" * 49
    expect(@user).to be_valid
  end

  it "invalid user with invalid name" do
    @user.name = "a" * 50
    expect(@user).to be_valid
  end

  it "invalid user with invalid name" do
    @user.name = "a" * 51
    expect(@user).not_to be_valid
  end

  it "invalid user with invalid email" do
    @user.email = ""
    expect(@user).not_to be_valid
    @user.email = "a" * 246 + "@foo.org"
    expect(@user).to be_valid
    @user.email = "a" * 247 + "@foo.org"
    expect(@user).to be_valid
    @user.email = "a" * 248 + "@foo.org"
    expect(@user).not_to be_valid
  end

  context "when email format is invalid" do
    it "emailのvalidateが正しく機能しているか" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        expect(FactoryBot.build(:user, email: invalid_address)).to be_invalid
      end
    end
  end

  context "when email addresses should be unique" do
    it "emailは一意であること" do
      #@userを複製してduplicate_userに格納
      duplicate_user = @user.dup
      #@userのemailを大文字でduplcate_userのemailに格納
      duplicate_user.email = @user.email.upcase
      @user.save!
      expect(duplicate_user).to be_invalid
    end
  end

  it "emailを小文字に変換後の値と大文字を混ぜて登録されたアドレスが同じか" do
    #わかりやすくベタ書き

    @user.email = "Foo@ExAMPle.CoM"
    @user.save!

    #全て小文字のemailと等しいかのテスト
    expect(@user.reload.email).to eq "foo@example.com"
  end

  it "passwordが空白になっていないか" do
    #" "* 6だけだと何をテストしているのか曖昧なため、"a"*6の場合のテストも追加
    #"a"が6文字のパスワードのテスト
    @user.password = @user.password_confirmation = "a" * 6
    expect(@user).to be_valid

    #" "が６文字のパスワードのテスト
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to_not be_valid
  end

  #パスワードのテスト
  describe "password length" do
    context "パスワードが7桁の時" do
        it "正しいかつ一致している" do
          @user = FactoryBot.build(:user, password: "a" * 7, password_confirmation: "a" * 7)
          expect(@user).to be_valid
        end
      end

    context "パスワードが６桁の時" do
      it "正しいかつ一致している" do
        @user = FactoryBot.build(:user, password: "a" * 6, password_confirmation: "a" * 6)
        expect(@user).to be_valid
      end
    end

    context "パスワードが５桁の時" do
      it "正しくない" do
        @user = FactoryBot.build(:user, password: "a" * 5, password_confirmation: "a" * 5)
        expect(@user).to be_invalid
      end
    end


  context "passが空白の時" do
    it "正しくない" do
      @user = FactoryBot.build(:user, password: "", password_confirmation: "a" * 6)
      expect(@user).to be_invalid
    end
  end

  context "pass-conが空白の時" do
    it "正しくない" do
      @user = FactoryBot.build(:user, password: "a" * 6, password_confirmation: "")
      expect(@user).to be_invalid
    end
  end
end

  context "パスワードが一致しない時" do
      it "passwordとpass-confirmは一致していないと「doesn't」が表示されること	" do
        user = FactoryBot.build(:user, password: "a" * 6, password_confirmation: "b" * 6)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
  end
end
