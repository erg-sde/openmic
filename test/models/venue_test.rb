require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @venue = Venue.new(
      email: "valid@email.com",
      password: "foobar", password_confirmation: "foobar"
    )
  end

  test "creates a venue on Venue.new" do
    assert_instance_of  Venue, @venue, "Object not an instance of venue"
  end

  test "Venue has a .email method" do
    assert_respond_to (Venue.new), :email, "Venue has no .email method"
  end

  test "Venue validates :email presence" do
    @venue.email = nil
    refute @venue.save
  end

  test "email addresses should be unique" do
    duplicate_venue = @venue.dup
    @venue.save
    assert_not duplicate_venue.valid?
  end

  test "email should not be too long" do
   @venue.email = "a" * 244 + "@example.com"
   assert_not @venue.valid?
 end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @venue.email = mixed_case_email
    @venue.save
    assert_equal mixed_case_email.downcase, @venue.reload.email
  end

  test "email validation should accept valid addresses" do
   valid_addresses = %w[venue@example.com VENUE@foo.COM A_VE-NUE@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
   valid_addresses.each do |valid_address|
     @venue.email = valid_address
     assert @venue.valid?, "#{valid_address.inspect} should be valid"
   end
 end

 test "email validation should reject invalid addresses" do
   invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
   invalid_addresses.each do |invalid_address|
     @venue.email = invalid_address
     assert_not @venue.valid?, "#{invalid_address.inspect} should be invalid"
   end
 end

 test "Venue has a .password method" do
   assert_respond_to (Venue.new), :password, "User has no .password method"
 end

  test "Venue validates :password presence" do
    @venue.password = nil
    refute @venue.save
  end

  test "password should be present (nonblank)" do
    @venue.password = @venue.password_confirmation = " " * 6
    assert_not @venue.valid?
  end

  test "password should have a minimum length" do
    @venue.password = @venue.password_confirmation = "a" * 5
    assert_not @venue.valid?
  end

  # test "User has an encrypted password field with minimum 4 characters"
  # test "User validates username format for valid email"

end
