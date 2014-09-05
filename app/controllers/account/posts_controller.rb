class Account::PostsController < ApplicationController
	before_action :login_required

	def index
		#@posts = current_user.posts
		@posts = current_user.posts.order("updated_at DESC")
		@groups = current_user.participated_groups.order("posts_count DESC")
	end
end
