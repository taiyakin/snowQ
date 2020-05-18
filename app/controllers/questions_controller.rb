class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    @contents = [{genre:"初心者",path: "/categorises/1"},{genre:"フリーラン",path: "/categorises/2"},{genre:"カービング",path: "/categorises/3"},{genre:"パウダー",path: "/categorises/4"},{genre:"グラトリ",path: "/categorises/5"},{genre:"ラントリ",path: "/categorises/6"},{genre:"キッカー",path: "/categorises/7"},{genre:"ジブ",path: "/categorises/8"},{genre:"ハーフパイプ",path: "/categorises/9"},{genre:"バックカントリー",path: "/categorises/10"},{genre:"アルペン",path: "/categorises/11"},{genre:"俺の滑り見て！",path: "/categorises/12"},{genre:"ギア関連",path: "/categorises/13"},{genre:"その他何でも",path: "/categorises/14"},]

  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    Question.find(params[:id])
    @answer = Answer.new
    @answers= @question.answers.includes(:user)
  end

  # GET /questions/new
  def new
    @question = Question.new
    @categorise = Category.all

  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @categorise = Category.all
    respond_to do |format|
      if @question.save!
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
