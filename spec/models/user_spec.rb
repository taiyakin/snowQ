require 'rails_helper'
describe User do

  describe '#create' do
    it "nameとemail、passwordが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe '#create' do
    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe '#create' do
  it "nameが20文字以上の場合は登録できないこと" do
    user = build(:user, name: "aaaaaaaaaaaaaaaaaaaaa")
    user.valid?
    expect(user.errors[:name]).to include("is too long (maximum is 20 characters)")
    end
  end

  describe '#create' do
  it "nameが20文字以下の場合は登録できる" do
    user = build(:user, name: "aaaaaaaaaaaaaaaaaaaa")
    expect(user).to be_valid
    end
  end

  describe '#create' do
  it "emailがない場合は登録できないこと" do
    user = build(:user, email: "")
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
    end
  end

  it "重複したemailが存在する場合登録できないこと" do
    user = create(:user)
    another_user = build(:user)
    another_user.valid?
    expect(another_user.errors[:email]).to include("has already been taken")
  end

  describe '#create' do
  it "passwordがない場合は登録できないこと" do
    user = build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
    end
  end


end