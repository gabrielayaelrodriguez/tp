require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
  end

  test "should get index" do
    get lists_url
    assert_response :success
  end

  test "should get new" do
    get new_list_url
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post lists_url, params: { list: { name: "lista2" } }
    end

    assert_redirected_to list_url(List.last)
  end

  test "should show list" do
    get list_url(@list)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_url(@list)
    assert_response :success
  end

  test "should update list" do
    patch list_url(@list), params: { list: { name: "lista" } }
    assert_redirected_to list_url(@list)
  end

  #hasta acá era el esqueleto

  test "should not create list without a name" do
    assert_no_difference('List.count') do
      post lists_url, params: { list: { name: "" } }
    end

  end

  test "should respect slut" do
    @list=List.new(name: "lista de prueba")
    assert_not @list.save
  end

end
