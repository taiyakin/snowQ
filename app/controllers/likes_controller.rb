class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(answer_id:  params[:answer_id])
    render 'create.js.erb'
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, answer_id: params[:answer_id])
    @like.destroy
    render 'destroy.js.erb'
  end
end
