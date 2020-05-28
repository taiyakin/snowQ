class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(answer_id:  params[:answer_id])
    render 'create.js.erb'
    # current_user.likes.create!を使う方がrails way
  end


  def destroy
    @like = Like.find_by(user_id: current_user.id, answer_id: params[:answer_id])
    @like.destroy
    render 'destroy.js.erb'
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end


  def set_answer
    @answer = Answer.find(params[:id])
  end

  def like_params
    params.require(:like).merge(user_id: current_user.id, answer_id:@answer.id)
  end
end
