class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments , dependent: :destroy
	has_many :favorites , dependent: :destroy

	# has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 # has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

 # has_many :followings, through: :relationships, source: :followed
 # has_many :followers, through: :reverse_of_relationships, source: :follower

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

  # # フォローしたときの処理
  # def follow(user_id)
  #   relationships.create(followed_id: user_id)
  # end
  # # フォローを外すときの処理
  # def unfollow(user_id)
  #   relationships.find_by(followed_id: user_id).destroy
  # end
  # # フォローしているか判定
  # def following?(user)
  #   followings.include?(user)
  # end


end
