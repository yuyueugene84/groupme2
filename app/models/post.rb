class Post < ActiveRecord::Base
	belongs_to :group
	validates :content, :presence => true
	#check if a post has any content
end
