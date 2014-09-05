class Group < ActiveRecord::Base
	belongs_to :owner, :class_name => "User", :foreign_key => :user_id
	has_many :posts
	has_many :group_users
    has_many :members, :through => :group_users, :source => :group

	validates :title, :presence => true

	after_create :join_owner_to_group

	def editable_by?(user)
		user && user == owner
	end

    def join_owner_to_group
        members << owner
    end

	#make sure user has input a title
end
