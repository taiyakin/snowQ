require 'rails_helper'

describe QuestionsController do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new

    end
  end
end

describe 'GET #edit' do
it "@tweetに正しい値が入っていること" do
  question = create(:question)
  get :edit, params: { id: tweet }
end

it "edit.html.erbに遷移すること" do
end
end