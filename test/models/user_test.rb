require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user=User.new(name:"岳丽珠",email:"ylz@hch.com")
  end
  test "should be vaild" do
  	assert	@user.valid?
  end
  test "name should be present" do
	@user.name = "    "
	assert_not @user.valid?
  end
  test "email should also be present" do
  	@user.email=""
  	assert_not @user.valid?
  end
  test "用户名长度不超过51" do
  	@user.name="a"*51
  	assert_not @user.valid?
  end
  test "邮箱不能超过244" do
  	@user.email="a"*244+"@imudges.com"
  	assert_not @user.valid?
  end
end
