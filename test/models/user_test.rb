require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      email: "valid@email.com",
      password: "foobar", password_confirmation: "foobar"
    )
  end

  test "creates a user on User.new" do
    assert_instance_of  User, @user, "Object not an instance of user"
  end

  test "User has a .email method" do
    assert_respond_to (User.new), :email, "User has no .email method"
  end

  test "User validates :email presence" do
    @user.email = nil
    refute @user.save
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should not be too long" do
   @user.email = "a" * 244 + "@example.com"
   assert_not @user.valid?
 end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "email validation should accept valid addresses" do
   valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
   valid_addresses.each do |valid_address|
     @user.email = valid_address
     assert @user.valid?, "#{valid_address.inspect} should be valid"
   end
 end

 test "email validation should reject invalid addresses" do
   invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
   invalid_addresses.each do |invalid_address|
     @user.email = invalid_address
     assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
   end
 end

 test "User has a .password method" do
   assert_respond_to (User.new), :password, "User has no .password method"
 end

  test "User validates :password presence" do
    @user.password = nil
    refute @user.save
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  # test "User has an encrypted password field with minimum 4 characters"
  # test "User validates username format for valid email"

end
