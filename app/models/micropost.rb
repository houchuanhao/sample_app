class Micropost < ApplicationRecord
 	 belongs_to :user
 	 has_many :commits,dependent: :destroy  #用户删除时微薄也删除
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
end
