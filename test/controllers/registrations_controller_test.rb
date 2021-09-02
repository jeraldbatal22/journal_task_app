require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  # def setup
  #   @user = User.create(
  #     username: 'jerald',
  #     firstname: 'jerald',
  #     lastname: 'batal',
  #     email: 'jerald@batal.com',
  #     password: '12341234',
  #     password_confirmation: '12341234',
  #   )
  # end
  test "Should go to signup_new_path" do
    assert_routing signup_path, :controller => "registrations", :action => "new"
  end

  test "Should create account" do
    assert_difference 'User.count', 1 do
    post signup_path, params: { user: { username: "jerald", firstname: "jerald", lastname: "batal", email: "jerald@batal.com", password: "12341234", password_confirmation: "12341234" } }
    end
  end

  # test "can create an user" do
  #   assert_difference 'User.count', 1 do
  #   @user = User.create(
  #         username: 'jerald',
  #         firstname: 'jerald',
  #         lastname: 'batal',
  #         email: 'jerald@batal.com',
  #         password: '12341234',
  #         password_confirmation: '12341234',
  #       )
  #     post signup_create_path
  #     assert_redirected_to root_path
  #   end
    # get signup_new_path
    # assert_response :success

    # post signup_create_path,
    # params: { user: { username: "jerald", firstname: "jerald", lastname: "batal", email: "jerald@batal.com", password: "12341234", password_confirmation: "12341234" } }
    # assert_response :redirect
    # follow_redirect!
    # assert_response :success
    # assert_select "p", "Title:\n  can create"
  # end

  # test "can create an user" do
  #   get signup_new_path
  #   assert_response :success
  
  #   post signup_create_path,
  #   params: { user: { username: "jerald", firstname: "jerald", lastname: "batal", email: "jerald@batal.com", password: "12341234", password_confirmation: "12341234" } }
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_response :success
  #   assert_select "p", "Title:\n  can create"

    # post signup_create_path,
    # params: { article: { title: "can create", body: "article successfully." } }
    # assert_response :redirect
    # follow_redirect!
    # assert_response :success
    # assert_select "p", "Title:\n  can create"
    #   params: { user: { username: "jerald", firstname: "jerald", lastname: "batal", email: "jerald@batal.com", password: "12341234", password_confirmation: "12341234" } }
    # assert_response :redirect
    # follow_redirect!
    # assert_response :success
    # assert_select "p", "Title:\n  can create"
  # end
  
end
