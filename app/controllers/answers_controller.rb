class AnswersController < ApplicationController
  def index
  @question=Question.find_by_id(params[:question_id])
  @answer ||= Answer.new
  @answer.save
  end
  
  def new
  @question=Question.find_by_id(params[:question_id])
  @answer ||= Answer.new
  end
  
  def create
  @question = Question.find_by_id(params[:question_id])
  @answer = @question.answers.build(params[:answer])
  redirect_to(:root)
  @answer.save
  end

end
