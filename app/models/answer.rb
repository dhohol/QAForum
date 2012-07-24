class Answer < ActiveRecord::Base
  attr_accessible :author, :body, :question_id
  
    #A question can have many answers
  belongs_to :question
end
