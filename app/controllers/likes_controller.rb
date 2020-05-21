class LikesController < ApplicationController

  
  # GET /likes/new
  def new
    @like = Like.new
  end

  def create

    @like = Like.create(user_id: current_user.id, answer_id: params[:answer_id])

    @like.save!
  end


  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
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
