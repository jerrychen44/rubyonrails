require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase


  def setup
    @category = Category.create(name: "sports")
    #create a admin user.
    #for the test "should redirect create when admin not logged in" below
    @user = User.create(username: "jone",email: "john@example.com",password: "password", admin:true)
  end

  test "sholud get categories index" do
    get :index
    assert_response :success
  end



  test "sholud get new" do
    #simulate jone's id into the session,
    #which means we fake that john is logged in.(and also he is a admin)
    session[:user_id] = @user.id
    get :new
    assert_response :success

  end

  test "should get show" do
    get( :show, {'id'=> @category.id})
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "sports"}
      #we expect get to redirection after above line.
      #which means, we don't think above line will be successfuly excuted.
    end
    assert_redirected_to categories_path
  end





end
