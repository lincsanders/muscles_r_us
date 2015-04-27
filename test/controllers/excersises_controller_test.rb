require 'test_helper'

class ExcersisesControllerTest < ActionController::TestCase
  setup do
    @excersise = excersises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:excersises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create excersise" do
    assert_difference('Excersise.count') do
      post :create, excersise: { name: @excersise.name, reps: @excersise.reps, sets: @excersise.sets }
    end

    assert_redirected_to excersise_path(assigns(:excersise))
  end

  test "should show excersise" do
    get :show, id: @excersise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @excersise
    assert_response :success
  end

  test "should update excersise" do
    patch :update, id: @excersise, excersise: { name: @excersise.name, reps: @excersise.reps, sets: @excersise.sets }
    assert_redirected_to excersise_path(assigns(:excersise))
  end

  test "should destroy excersise" do
    assert_difference('Excersise.count', -1) do
      delete :destroy, id: @excersise
    end

    assert_redirected_to excersises_path
  end
end
