class Post < ActiveRecord::Base
	belongs_to :group
	belongs_to :group, :counter_cache => true
	validates :content, :presence => true

	belongs_to :author, :class_name => "User", :foreign_key => :user_id
	#check if a post has any content

	def editable_by?(user)
		user && user == author
	end
end
