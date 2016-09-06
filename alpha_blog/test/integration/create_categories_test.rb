require 'test_helper'
#http://guides.rubyonrails.org/testing.html
class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and create category"  do
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

end
