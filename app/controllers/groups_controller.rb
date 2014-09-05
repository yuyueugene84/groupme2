class GroupsController < ApplicationController

def index
	@groups = Group.all
end

def show
	@group = Group.find(params[:id])
	@posts = @group.posts
end

def new 
	@group = Group.new
end

def create
	#@group = Group.new(params[:group])
	#@group.save
	#redirect_to groups_path

	@group = Group.new(group_params)

	if @group.save
		redirect_to groups_path
	else
		render :new 
	end
end

def edit
	@group = Group.find(params[:id])	
	#@post = @group.posts.find(params[:id])
end

def update
	@group = Group.find(params[:id])	
	#form data into hash, if group update data from hash successful, then it will be redirected back to index
	if @group.update(group_params)
		redirect_to group_path(@group)	
	else
	#if group data update fails, then it will show edit page again
		render :edit
	end
end

def destroy
	@group = Group.find(params[:id])
	
	@group.destroy
	
	redirect_to groups_path
end


private

def group_params
	params.require(:group).permit(:title, :description)
end





end
#end file
