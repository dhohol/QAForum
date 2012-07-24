class QuestionsController < ApplicationController
  def index
    @question ||= Question.new
    @questions = question_list
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to(:root)
    else
      @questions = question_list
      render :index
    end
  end
  
  def show
    @question = Question.find_by_id(params[:question_id])
  end
  
private  
  def question_list
    Question.paginate(:page => params[:page], :per_page => 4)
  end
end
