require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD

=======
>>>>>>> account-activation
  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
<<<<<<< HEAD
                                              email: "foo@invalid",
                                              password:             "foo",
=======
                                              email: "foo@invalid", 
                                              password:              "foo",
>>>>>>> account-activation
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
<<<<<<< HEAD
    name   = "Foo Bar"
    email  = "foo@bar.com"
=======
    name = "Foo bar"
    email = "foo@bar.com"
>>>>>>> account-activation
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
<<<<<<< HEAD
    assert_equal name , @user.name
=======
    assert_equal name, @user.name
>>>>>>> account-activation
    assert_equal email, @user.email
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
<<<<<<< HEAD
    name   = "Foo Bar"
    email  = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password:              "",
=======
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password:              "", 
>>>>>>> account-activation
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
<<<<<<< HEAD
    assert_equal name , @user.name
=======
    assert_equal name, @user.name
>>>>>>> account-activation
    assert_equal email, @user.email
  end
end
