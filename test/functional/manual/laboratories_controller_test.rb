require 'test_helper'

class Manual::LaboratoriesControllerTest < ActionController::TestCase
  setup do
    @manual_laboratory = manual_laboratories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manual_laboratories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manual_laboratory" do
    assert_difference('Manual::Laboratory.count') do
      post :create, manual_laboratory: {  }
    end

    assert_redirected_to manual_laboratory_path(assigns(:manual_laboratory))
  end

  test "should show manual_laboratory" do
    get :show, id: @manual_laboratory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manual_laboratory
    assert_response :success
  end

  test "should update manual_laboratory" do
    put :update, id: @manual_laboratory, manual_laboratory: {  }
    assert_redirected_to manual_laboratory_path(assigns(:manual_laboratory))
  end

  test "should destroy manual_laboratory" do
    assert_difference('Manual::Laboratory.count', -1) do
      delete :destroy, id: @manual_laboratory
    end

    assert_redirected_to manual_laboratories_path
  end
end
