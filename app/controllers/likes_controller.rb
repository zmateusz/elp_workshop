class LikesController < ApplicationController

  def create

    @object = Question.find(params[:id]) if params[:type] == "question"
    @object = Answer.find(params[:id]) if params[:type] == "answer"
    Like.create(
      user: current_user,
      likeable: @object)
    if params[:type] == "question"
      redirect_to @object
    else
      redirect_to @object.question
    end
  end

  def delete
    @like = Like.where("likeable_id = ? AND likeable_type = ?", params[:id], params[:type].capitalize).first
    @like.destroy
    if params[:type] == "question"
      redirect_to question_path(params[:id])
    else
      redirect_to question_path(params[:question_id])
    end
  end
end
