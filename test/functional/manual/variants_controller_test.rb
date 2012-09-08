require 'test_helper'

class Manual::VariantsControllerTest < ActionController::TestCase
  setup do
    @manual_variant = manual_variants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manual_variants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manual_variant" do
    assert_difference('Manual::Variant.count') do
      post :create, manual_variant: {  }
    end

    assert_redirected_to manual_variant_path(assigns(:manual_variant))
  end

  test "should show manual_variant" do
    get :show, id: @manual_variant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manual_variant
    assert_response :success
  end

  test "should update manual_variant" do
    put :update, id: @manual_variant, manual_variant: {  }
    assert_redirected_to manual_variant_path(assigns(:manual_variant))
  end

  test "should destroy manual_variant" do
    assert_difference('Manual::Variant.count', -1) do
      delete :destroy, id: @manual_variant
    end

    assert_redirected_to manual_variants_path
  end
end
