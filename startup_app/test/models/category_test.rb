require 'test_helper'
class Test < ActiveSupport::TestCase
   #This method will run before every test
   def setup
    @category = Category.new(name: "sports")
   end
   test "category should be valid" do
       assert @category.valid?
   end

   test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
   end

   test "name should be unique" do
        @category.save
        @category2 = Category.new(name: "Sports")
        assert_not @category2.valid?
    end

    test "name should not very long" do
        @category.name = "a"*100
        assert_not @category.valid?
    end

    test "name should not be too short" do
        @category.name = "a"
        assert_not @category.valid?

        @category.name = "aa"
        assert_not @category.valid?

    end

end