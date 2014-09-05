class Group < ActiveRecord::Base

	has_many :posts
	validates :title, :presence => true

	#make sure user has input a title
end
