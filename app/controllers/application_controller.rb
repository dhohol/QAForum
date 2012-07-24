class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def answer_path(answer)
    question_path(answer.question, :anchor => "answer_#{answer.id}")
  end
end
