require 'test_helper'

class ForgotmailsControllerTest < ActionController::TestCase
  setup do
    @forgotmail = forgotmails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forgotmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forgotmail" do
    assert_difference('Forgotmail.count') do
      post :create, forgotmail: {  }
    end

    assert_redirected_to forgotmail_path(assigns(:forgotmail))
  end

  test "should show forgotmail" do
    get :show, id: @forgotmail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forgotmail
    assert_response :success
  end

  test "should update forgotmail" do
    patch :update, id: @forgotmail, forgotmail: {  }
    assert_redirected_to forgotmail_path(assigns(:forgotmail))
  end

  test "should destroy forgotmail" do
    assert_difference('Forgotmail.count', -1) do
      delete :destroy, id: @forgotmail
    end

    assert_redirected_to forgotmails_path
  end
end
