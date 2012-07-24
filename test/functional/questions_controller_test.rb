require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question)
    assert_not_nil assigns(:questions)
  end

  test "should get show" do
    get :show, :question_id => 1
    assert_not_nil assigns(:question) 
  end
  
  test "should save question" do
    assert_difference('Question.count') do
      post :create, :question => {:author => 'Bubs McGee', :body => "Hello?", :title => nil}
    end
    assert_redirected_to :root
    css_select ".question:first-child" do
      assert_select "h2", "Bubs McGee asked"
      assert_select "p",  "Hello?"
    end
  end
  
  test "should re-render page on save failure" do
    assert_no_difference('Question.count') do
      post :create, :question => {:author => 'Bubs McGee', :body => nil, :title => nil}
    end
    assert_response 200
    assert_select "#question_post" do
      assert_select ".field_with_errors #question_body", ""
      assert_equal("Bubs McGee", css_select("#question_author").first.attributes["value"])
    end
  end
end
