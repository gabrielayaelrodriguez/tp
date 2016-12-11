require 'test_helper'

class SimpleTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @simple_task = simple_tasks(:one)
  end

  test "should get index" do
    get simple_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_simple_task_url
    assert_response :success
  end

  test "should create simple_task" do
    assert_difference('SimpleTask.count') do
      post simple_tasks_url, params: { simple_task: {  } }
    end

    assert_redirected_to simple_task_url(SimpleTask.last)
  end

  test "should show simple_task" do
    get simple_task_url(@simple_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_simple_task_url(@simple_task)
    assert_response :success
  end

  test "should update simple_task" do
    patch simple_task_url(@simple_task), params: { simple_task: {  } }
    assert_redirected_to simple_task_url(@simple_task)
  end

  test "should destroy simple_task" do
    assert_difference('SimpleTask.count', -1) do
      delete simple_task_url(@simple_task)
    end

    assert_redirected_to simple_tasks_url
  end
end
