class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order(created_at: :desc).page(params[:page]).per(20)
    @contents = [{genre:"初心者",path: "/categories/1"},{genre:"フリーラン",path: "/categories/2"},{genre:"カービング",path: "/categories/3"},{genre:"パウダー",path: "/categories/4"},{genre:"グラトリ",path: "/categories/5"},{genre:"ラントリ",path: "/categories/6"},{genre:"キッカー",path: "/categories/7"},{genre:"ジブ",path: "/categories/8"},{genre:"ハーフパイプ",path: "/categories/9"},{genre:"バックカントリー",path: "/categories/10"},{genre:"アルペン",path: "/categories/11"},{genre:"俺の滑り見て！",path: "/categories/12"},{genre:"ギア関連",path: "/categories/13"},{genre:"その他何でも",path: "/categories/14"},]

  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = Answer.new
    @answers= @question.answers.includes(:user)

  end

  # GET /questions/new
  def new
    @question = Question.new
    @categories = Category.all

  end

  # GET /questions/1/edit
  def edit

  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @categories = Category.all
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
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

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :text, :video, :image, :category_id).merge(user_id:current_user.id)
    end
end
