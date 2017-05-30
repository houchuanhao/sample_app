class User < ApplicationRecord
	has_many :microposts,dependent: :destroy  #用户删除时微薄也删除
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	                   #/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	#before_save {self.email=email.downcase}
	before_save { email.downcase! }
	validates(:name, 
		presence: true,
		length: {maximum:50}
		) #两个参数，一个是name,一个是哈希参数：{presence: true}
	validates(
		:email,
		presence: true,
		length: {maximum: 250},
		format: { with: VALID_EMAIL_REGEX }, 
		#uniqueness: true   #唯一，并且区分大小写
		uniqueness: { case_sensitive: false }  #唯一，并且不区分大小写
		)
	has_secure_password
	validates :password, presence: true, length: { minimum: 4 }
end
