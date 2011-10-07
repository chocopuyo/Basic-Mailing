require 'test_helper'

class MailBodiesControllerTest < ActionController::TestCase
  setup do
    @mail_body = mail_bodies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail_bodies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail_body" do
    assert_difference('MailBody.count') do
      post :create, mail_body: @mail_body.attributes
    end

    assert_redirected_to mail_body_path(assigns(:mail_body))
  end

  test "should show mail_body" do
    get :show, id: @mail_body.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail_body.to_param
    assert_response :success
  end

  test "should update mail_body" do
    put :update, id: @mail_body.to_param, mail_body: @mail_body.attributes
    assert_redirected_to mail_body_path(assigns(:mail_body))
  end

  test "should destroy mail_body" do
    assert_difference('MailBody.count', -1) do
      delete :destroy, id: @mail_body.to_param
    end

    assert_redirected_to mail_bodies_path
  end
end
