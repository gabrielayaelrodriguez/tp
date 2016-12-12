require 'test_helper'

class SimpleTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @list = List.create(name: 'list')
  end
  
  
  test "should not create a task without data" do
      task = SimpleTask.new()
      assert_not task.save
  end

  test "should create a task succesfully" do
      task = SimpleTask.new(description: 'a description', state: 'Done', priority: 'Low', list: @list)
      assert task.save
  end
end