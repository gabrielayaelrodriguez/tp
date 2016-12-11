require 'test_helper'

class TemporalTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temporal_task = temporal_tasks(:one)
  end

  test "should get index" do
    get temporal_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_temporal_task_url
    assert_response :success
  end

  test "should create temporal_task" do
    assert_difference('TemporalTask.count') do
      post temporal_tasks_url, params: { temporal_task: {  } }
    end

    assert_redirected_to temporal_task_url(TemporalTask.last)
  end

  test "should show temporal_task" do
    get temporal_task_url(@temporal_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_temporal_task_url(@temporal_task)
    assert_response :success
  end

  test "should update temporal_task" do
    patch temporal_task_url(@temporal_task), params: { temporal_task: {  } }
    assert_redirected_to temporal_task_url(@temporal_task)
  end

  test "should destroy temporal_task" do
    assert_difference('TemporalTask.count', -1) do
      delete temporal_task_url(@temporal_task)
    end

    assert_redirected_to temporal_tasks_url
  end
end
