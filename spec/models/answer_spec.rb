require 'rails_helper'
describe Answer do

  describe '#create' do
    it "text,video,image,user_id,question_idが存在すれば登録できること" do
      answer = build(:answer)
      expect(answer).to be_valid
    end
  end

  describe '#create' do
    it "textがない場合は登録できないこと" do
      answer = build(:answer, text: "")
      answer.valid?
      expect(answer.errors[:text]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "imageが空でも登録できること" do
      answer = build(:answer, image: "")
      expect(answer).to be_valid
  end
end

  describe '#create' do
    it "videoが空でも登録できること" do
      answer = build(:answer, video: "")
      expect(answer).to be_valid
    end
  end

end