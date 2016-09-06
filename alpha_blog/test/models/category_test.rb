require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end


  test "category sholud be valid" do

    assert @category.valid?

  end

  test "name should be present" do
    #http://guides.rubyonrails.org/active_record_validations.html#presence
    @category.name = " "
    puts "\n\n jerry name should be present testing =#{@category.valid?}"
    assert_not @category.valid?
  end


  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end



  test "name should not be too long" do
    @category.name = "a" *26
    puts "\n\n jerry name should not be too long testing =#{@category.valid?}"
    assert_not @category.valid?
  end


  test "name sholud not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

end
