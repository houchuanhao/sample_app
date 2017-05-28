class User < ApplicationRecord
	validates(:name,presence: true,length: {maximum:50}) #两个参数，一个是name,一个是哈希参数：{presence: true}
	validates(:email,presence: true,length:{maximum: 250})
end
