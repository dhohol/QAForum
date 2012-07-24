require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "Empty author should not save" do
    question = Question.new
    question.body = "body"
    assert !question.save
  end
  test "Empty body should not save" do
    question = Question.new
    question.author = "author"
    assert !question.save
  end
  test "Author with too long of a name" do
    question = Question.new
    question.author = (("a".."z").to_a*4).shuffle.to_s
    question.body = "body"
    assert !question.save
  end
  test "Questions in DESC order" do
    questions_sorted = Question.all.map!{ |q| q.created_at}.sort{|a,b| b <=> a }
    questions_db = Question.all.map{|q| q.created_at}
    assert_equal( questions_sorted, questions_db)
  end
  
end
