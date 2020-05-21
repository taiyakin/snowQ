require 'rails_helper'
describe Category do


  describe '#create' do
    it "genreがない場合は登録できないこと" do
      user = build(:category, genre: "")
      user.valid?
      expect(user.errors[:genre]).to include("can't be blank")
    end
  end


end