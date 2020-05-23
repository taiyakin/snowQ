require 'rails_helper'

describe QuestionsController do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new

    end
  end


  describe 'GET #show' do
    it "@questionに正しい値が入っていること" do
      question = create(:question)
      get :show, params: { id: question }
      expect(assigns(:question)).to eq question
    end

    it "show.html.hamlに遷移すること" do
      question = create(:question)
      get :show, params: { id: question }
      expect(response).to render_template :show
      end
  end

  describe 'GET #edit' do
    it "@questionに正しい値が入っていること" do
      question = create(:question)
      get :edit, params: { id: question }
      expect(assigns(:question)).to eq question
    end

    it "edit.html.hamlに遷移すること" do
      question = create(:question)
      get :edit, params: { id: question }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@questionに正しい値が入っていること" do
      questions = create_list(:question, 3)
      get :index
      expect(assigns(:questions)).to match(questions.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end




end