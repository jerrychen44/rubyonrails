require 'test_helper'
#http://guides.rubyonrails.org/testing.html
class CreateCategoriesTest < ActionDispatch::IntegrationTest

  #  categories GET    /categories(.:format)          categories#index
  #             POST   /categories(.:format)          categories#create
  #new_category GET    /categories/new(.:format)      categories#new
  #edit_category GET    /categories/:id/edit(.:format) categories#edit
  #    category GET    /categories/:id(.:format)      categories#show
  #             PATCH  /categories/:id(.:format)      categories#update
  #             PUT    /categories/:id(.:format)      categories#update


  def setup
    #because we add the test "should redirect create when admin not logged in"
    #/test/controllers/categories_controller_test.rb
    #so we need to let originl test to login as admin.
    #use User.create will also hit to database.
    @user = User.create(username: "jone",email: "john@example.com",password: "password", admin:true)
  end




  test "get new category form and create category"  do

    #because we add the test "should redirect create when admin not logged in"
    #/test/controllers/categories_controller_test.rb
    #so we need to let originl test to login as admin.
    sign_in_as(@user, "password") #sign_in_as method will implement in /test/test_helper.rb


    get new_category_path # in rake routes=>  new_category GET    /categories/new(.:format)      categories#new
    assert_template 'categories/new' #to check the categories new html is ok or not

    #http://api.rubyonrails.org/classes/ActiveSupport/Testing/Assertions.html#method-i-assert_difference
    assert_difference 'Category.count',1 do #if the cateogry count add 1. (count change +1)
      #category GET    /categories/:id(.:format)      categories#show
      #to test is people created one category, then go to show view is ok or not
      post_via_redirect categories_path, category: {name: "sports"}
    end
    #check index view is ok or not
    assert_template 'categories/index'
    #to check the index body has "sports" or not , which means we created category need to be see
    #in the index page
    assert_match "sports", response.body
  end





  test "invalid category submission results in failure" do


    #because we add the test "should redirect create when admin not logged in"
    #/test/controllers/categories_controller_test.rb
    #so we need to let originl test to login as admin.
    sign_in_as(@user, "password")



    #if I get the /categories/new get request
    #new_category GET    /categories/new(.:format)      categories#new
    #  def new
    #   @category = Category.new
    #  end
    get new_category_path
    #I check this page is here or not.
    assert_template 'categories/new'

    #in this case, I don't want to my Category.count change.
    #which means, if no one add the Category, then I want to create
    #I new category name=" " by myself.
    assert_no_difference 'Category.count' do
      #   categories GET    /categories(.:format)          categories#index
      #              POST   /categories(.:format)          categories#create
      post categories_path, category: {name: " "}# will run the def create...end
      #and because the name: " " will be judge the save failed.
    end

    #because above code "post categories_path, category: {name: " "}" will cause
    #categories_controller.rb  :render 'new', so we expect the /new page
    #will be shown.

    assert_template 'categories/new'
    #if below two section can be found , means the error been rendered.
    assert_select 'h2.panel-title' #comes from app/views/shared/_errors.html.erb
    assert_select 'div.panel-body' #comes from app/views/shared/_errors.html.erb
    #if we pass the test, means the error html shows indeed
  end

end
