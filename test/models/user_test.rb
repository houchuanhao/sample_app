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
  	test "邮箱格式验证" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
  	end
	test "邮箱格式失败的验证" do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} 应该是错误的地址"
		end
	end
	test "邮箱唯一验证" do
		duplicate_user=@user.dup
		duplicate_user.email=@user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end
end
