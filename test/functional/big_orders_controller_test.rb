require 'test_helper'

class BigOrdersControllerTest < ActionController::TestCase
  setup do
    @big_order = big_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:big_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create big_order" do
    assert_difference('BigOrder.count') do
      post :create, :big_order => @big_order.attributes
    end

    assert_redirected_to big_order_path(assigns(:big_order))
  end

  test "should show big_order" do
    get :show, :id => @big_order.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @big_order.to_param
    assert_response :success
  end

  test "should update big_order" do
    put :update, :id => @big_order.to_param, :big_order => @big_order.attributes
    assert_redirected_to big_order_path(assigns(:big_order))
  end

  test "should destroy big_order" do
    assert_difference('BigOrder.count', -1) do
      delete :destroy, :id => @big_order.to_param
    end

    assert_redirected_to big_orders_path
  end
end
