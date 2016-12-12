require 'test_helper'

class LongTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @list = List.create(name: 'list')
  end
  
  
  test "should not create a task without data" do
      task = LongTask.new()
      assert_not task.save
  end

  test "should create a task succesfully" do
      task = LongTask.new(description: 'a description', state: 'Done',percentage: 10, priority: 'Low', list: @list)
      assert task.save
  end

  test "should not save percentage out of range" do
    task= LongTask.create(description: 'a description', state: 'Done',percentage: 10, priority: 'Low', list: @list)
    assert_not task.update(percentage: 900)
  end

end
