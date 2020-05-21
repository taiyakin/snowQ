class AnswersController < ApplicationController
  before_action :set_answer, only: [:destroy]

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    redirect_to "/questions/#{@answer.question.id}"
    @answer.save!
  end

  def destroy
    @answer.destroy
    redirect_to "/questions/#{@answer.question.id}"

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:text, :video, :image).merge(user_id: current_user.id, question_id: params[:question_id])
    end
end

