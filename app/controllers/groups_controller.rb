class GroupsController < ApplicationController
	before_action :login_required, :only => [:index, :new, :create, :edit,:update,:destroy]

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
	@group = current_user.groups.build(group_params)

	#@group = Group.new(group_params)

	if @group.save
		current_user.join!(@group)
		redirect_to groups_path
	else
		render :new 
	end
end

def edit
	#@group = Group.find(params[:id])	
	#@post = @group.posts.find(params[:id])
	@group = current_user.groups.build(group_params)
end

def update
	#@group = Group.find(params[:id])
	@group = current_user.groups.build(group_params)	
	#form data into hash, if group update data from hash successful, then it will be redirected back to index
	if @group.update(group_params)
		redirect_to group_path(@group)	
	else
	#if group data update fails, then it will show edit page again
		render :edit
	end
end

def destroy
	#@group = Group.find(params[:id])
	
	@group = current_user.groups.build(group_params)

	@group.destroy
	
	redirect_to groups_path
end

def join
    @group = Group.find(params[:id])
	    if !current_user.is_member_of?(@group)
	    current_user.join!(@group) 
	    else
	    flash[:warning] = "You already joined this group."
	    end
	    redirect_to group_path(@group)
end

def quit
    @group = Group.find(params[:id])

    if current_user.is_member_of?(@group)
       current_user.quit!(@group)
    else
    flash[:warning] = "You are not member of this group."
	end
    
    redirect_to group_path(@group)
 end


private

def group_params
	params.require(:group).permit(:title, :description)
end





end
#end file
