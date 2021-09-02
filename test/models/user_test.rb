require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(
      username: 'jerald',
      firstname: 'jerald',
      lastname: 'batal',
      email: 'jerald@batal.com',
      password: '12341234',
      password_confirmation: '12341234',
      )
  end

  test "should have valid user" do
    assert_not @user.valid?
  end

  test "should invalid empty username" do
    @user.username = ''
    assert_not @user.valid?
  end

  test "should invalid empty firstname" do
    @user.firstname = ''
    assert_not @user.valid?
  end

  test "should invalid empty lastname" do
    @user.lastname = ''
    assert_not @user.valid?
  end

  test "should invalid empty email" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "should invalid empty password_digest" do
    @user.password_digest = ''
    assert_not @user.valid?
  end

  test "should invalid email" do
    @user.email = "jerald@batal"
    assert_not @user.valid?
  end

  test "should invalid unique email and username" do
    new_user = User.create(
      username: 'jerald',
      email: 'jerald@batal.com')
    assert_not new_user.valid?
  end

  test "should invalid if password less than 8 characters" do
    @user.password_digest = '123'
    assert_not @user.valid?
  end

  test "user should not invalid correct password" do
    assert @user.password_digest = 'abcdefghasdsai'
  end

end
