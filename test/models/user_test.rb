require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid when name and email exists" do
    assert @user.valid?
  end

  test "should not be valid when name is invalid" do
    @user.name = nil
    assert_not @user.valid?
  end

  test "should be not be valid when name exceceds 50 characters" do
    @user.name = "5" * 51
    assert_not @user.valid?
  end

  test "should be not be valid when email exceceds 256 characters" do
    @user.email = "5" * 256
    assert_not @user.valid?
  end

  test "should be valid when email format is correct" do
    @user.email = "test@test.com"
    assert @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "change email to small letters before saving" do
    @user.email = "User@example.com"
    @user.save

    assert_equal(@user.email, "user@example.com")
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end
