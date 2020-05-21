require 'rails_helper'
describe Question do

  describe '#create' do
    it "title,text,video,image,user_id,category_idが存在すれば登録できること" do
      user = build(:user)
      question = build(:question)
      expect(question).to be_valid
    end
  end

  describe '#create' do
    it "titleがない場合は登録できないこと" do
      question = build(:question, title: "")
      question.valid?
      expect(question.errors[:title]).to include("can't be blank")
    end
  end

  describe '#create' do
  it "titleが20文字以上の場合は登録できないこと" do
    question = build(:question, title: "aaaaaaaaaaaaaaaaaaaaa")

    question.valid?
    expect(question.errors[:title]).to include("is too long (maximum is 20 characters)")
    end
  end

  describe '#create' do
  it "titleが20文字以下の場合は登録できる" do
    question = build(:question, title: "aaaaaaaaaaaaaaaaaaaa")
    expect(question).to be_valid
    end
  end

  describe '#create' do
  it "textがない場合は登録できないこと" do
    question = build(:question, text: "")
    question.valid?
    expect(question.errors[:text]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "imageが空でも登録できること" do
      question = build(:question, image: "")
      expect(question).to be_valid
  end
end

  describe '#create' do
    it "videoが空でも登録できること" do
      question = build(:question, video: "")
      expect(question).to be_valid
    end
  end



end