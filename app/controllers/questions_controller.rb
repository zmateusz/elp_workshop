require 'md_serv'
class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @questions_count = Question.count
    @answers_count = Answer.count
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    @question.user = current_user
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private
  def question_params
    params.require(:question).permit :title, :content
  end
end
