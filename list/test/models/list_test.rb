require 'test_helper'

class ListTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

  test "should not save list without name" do
    list = List.create()
    assert_not list.save
  end

end
