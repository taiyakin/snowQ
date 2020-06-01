class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @questions = Question.all.page(params[:page]).per(6).order(created_at: :desc)
    @categories = [{genre:"初心者",path: "/categories/1"},{genre:"フリーラン",path: "/categories/2"},{genre:"カービング",path: "/categories/3"},{genre:"パウダー",path: "/categories/4"},{genre:"グラトリ",path: "/categories/5"},{genre:"ラントリ",path: "/categories/6"},{genre:"キッカー",path: "/categories/7"},{genre:"ジブ",path: "/categories/8"},{genre:"ハーフパイプ",path: "/categories/9"},{genre:"バックカントリー",path: "/categories/10"},{genre:"アルペン",path: "/categories/11"},{genre:"俺の滑り見て！",path: "/categories/12"},{genre:"ギア関連",path: "/categories/13"},{genre:"その他何でも",path: "/categories/14"},]
  end

  def show
    @answer = Answer.new
    @answers= @question.answers.includes(:user)
  end

  def new
    @question = Question.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @question = Question.new(question_params)


    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @categories = [{genre:"初心者",path: "/categories/1"},{genre:"フリーラン",path: "/categories/2"},{genre:"カービング",path: "/categories/3"},{genre:"パウダー",path: "/categories/4"},{genre:"グラトリ",path: "/categories/5"},{genre:"ラントリ",path: "/categories/6"},{genre:"キッカー",path: "/categories/7"},{genre:"ジブ",path: "/categories/8"},{genre:"ハーフパイプ",path: "/categories/9"},{genre:"バックカントリー",path: "/categories/10"},{genre:"アルペン",path: "/categories/11"},{genre:"俺の滑り見て！",path: "/categories/12"},{genre:"ギア関連",path: "/categories/13"},{genre:"その他何でも",path: "/categories/14"},]
    @questions = Question.search(params[:keyword]).page(params[:page]).per(6).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json

    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :text, :video, :image, :category_id).merge(user_id:current_user.id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
