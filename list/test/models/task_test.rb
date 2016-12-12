require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @list = List.create(name: 'list')
    @temporalTask = TemporalTask.new(description: 'a description', state: 'Done', validation_start: Date.new(2016, 12, 01), validation_end: Date.new(2016, 12, 22), priority: 'Medium', list: @list)
    @longTask = LongTask.new(description: 'a description', state: 'Done',percentage: 10, priority: 'Low', list: @list)
    @simpleTask = SimpleTask.new(description: 'a description', state: 'Done', priority: 'High', list: @list)
    @tasks = [@temporalTask, @longTask, @simpleTask] 
    
  end

  test "should sort tasks based on priorities" do
  	@tasks= @tasks.sort
  	assert_equal('High', @tasks.shift.priority)
  	assert_equal('Medium', @tasks.shift.priority)
  	assert_equal('Low', @tasks.shift.priority)
  end
end