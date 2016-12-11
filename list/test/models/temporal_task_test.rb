require 'test_helper'

class TemporalTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @list = List.create(name: 'list')
  end
  
  
  test "should not create a task without a description" do
      task = TemporalTask.new()
      assert_not task.save
  end

  test "should create a task succesfully" do
      task = TemporalTask.new(description: 'a description', state: 'Done', validation_start: Date.new(2016, 12, 01), validation_end: Date.new(2016, 12, 22), priority: 'Low', list: @list)
      assert task.save
  end

  test "should not create a task succesfully" do
      task = TemporalTask.new(description: 'a description', state: 'Done', validation_start: Date.new(2016, 12, 22), validation_end: Date.new(2016, 12, 01), priority: 'Low', list: @list)
      assert_not task.save
  end

end
