require 'test_helper'

class LongTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @long_task = long_tasks(:one)
  end

  test "should get index" do
    get long_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_long_task_url
    assert_response :success
  end

  test "should create long_task" do
    assert_difference('LongTask.count') do
      post long_tasks_url, params: { long_task: {  } }
    end

    assert_redirected_to long_task_url(LongTask.last)
  end

  test "should show long_task" do
    get long_task_url(@long_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_long_task_url(@long_task)
    assert_response :success
  end

  test "should update long_task" do
    patch long_task_url(@long_task), params: { long_task: {  } }
    assert_redirected_to long_task_url(@long_task)
  end

  test "should destroy long_task" do
    assert_difference('LongTask.count', -1) do
      delete long_task_url(@long_task)
    end

    assert_redirected_to long_tasks_url
  end
end
