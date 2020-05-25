require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD

  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "index including pagination" do 
=======
  def setup
    @admin = users(:michael)
    @non_admin = users(:archer)
  end

  test "index as admin including pagination and delete links" do
>>>>>>> account-activation
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
<<<<<<< HEAD
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user| 
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete' 
      end
    end
    assert_difference 'User.count', -1 do
=======
    first_page_of_users = User.paginate(page:1)
    first_page_of_users.each do |user|
      assert_select'a[href=?]', user_path(user), text: user.name
      unless user == @admin 
        assert_select'a[href=?]', user_path(user), text:'delete'
      end
    end
    assert_difference 'User.count', -1 do 
>>>>>>> account-activation
      delete user_path(@non_admin)
    end
  end

<<<<<<< HEAD
  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
=======
  test "index as non-admin" do 
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text:'delete', count:0
>>>>>>> account-activation
  end
end
