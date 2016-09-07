require 'test_helper'
#http://guides.rubyonrails.org/testing.html
class ListCreateCategoriesTest < ActionDispatch::IntegrationTest


#  categories GET    /categories(.:format)          categories#index
#             POST   /categories(.:format)          categories#create
#new_category GET    /categories/new(.:format)      categories#new
#edit_category GET    /categories/:id/edit(.:format) categories#edit
#    category GET    /categories/:id(.:format)      categories#show
#             PATCH  /categories/:id(.:format)      categories#update
#             PUT    /categories/:id(.:format)      categories#update
  def setup
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end


  test "should show categories listing" do
    get categories_path #get index page request
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name

  end

end
