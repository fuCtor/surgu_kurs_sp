require 'test_helper'

class Manual::SubjectsControllerTest < ActionController::TestCase
  setup do
    @manual_subject = manual_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manual_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manual_subject" do
    assert_difference('Manual::Subject.count') do
      post :create, manual_subject: {  }
    end

    assert_redirected_to manual_subject_path(assigns(:manual_subject))
  end

  test "should show manual_subject" do
    get :show, id: @manual_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manual_subject
    assert_response :success
  end

  test "should update manual_subject" do
    put :update, id: @manual_subject, manual_subject: {  }
    assert_redirected_to manual_subject_path(assigns(:manual_subject))
  end

  test "should destroy manual_subject" do
    assert_difference('Manual::Subject.count', -1) do
      delete :destroy, id: @manual_subject
    end

    assert_redirected_to manual_subjects_path
  end
end
