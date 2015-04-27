class ProjectsController < ApplicationController
	def index
		#To loop through all the projects that are available to a particular user
		@projects = current_user.projects
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)
		#current_user.projects << @project
		UserProject.create(user_id: current_user.id, project_id: @project.id, admin: true)
		respond_to do |format|
		    format.html { redirect_to @project }
		    format.json { render :json => @project.to_json }
  		end
	end

	def show
		#@user = User.find(params[:id])
		@project = Project.find(params[:id])
		@proj_users = @project.users
		@users = User.where('id not in (?) ', @proj_users.map {|user| user.id })
		#UserProject.create(user_id: @user.id, project_id: @project.id, admin: false )
		
	end

	def edit
		
		#Can edit the project only if the user is an admin
		if UserProject.where("user_id = ? and project_id = ? and admin = ? ", current_user.id, params[:id], true).exists?
			@project = Project.find(params[:id])
		else
			redirect_to root_path
		end
	end
	
	def update
		@project = Project.find(params[:id])
		@project.update_attributes(project_params)
		@project.save
		respond_to do |format|
		    format.html { redirect_to @project }
		    format.json { render :json => @project.to_json }
  		end
	end

	def add_members
		@project = Project.find(params[:id])
		UserProject.create(user_id: params[:project][:user_id], project_id: params[:id], admin: false)
		respond_to do |format|
		    format.html { redirect_to @project }
		    format.json { render :json => @project.to_json }
  		end
		
	end

	def destroy 
		@project = Project.find(params[:id])

		#can destroy the project only if the user is an admin
		if UserProject.where("user_id = ? and project_id = ? and admin = ? ", current_user.id, params[:id], true).exists?
			@project.destroy
		end
			redirect_to root_path
	end
	
	def chat_interface
		respond_to do |format|
  		 format.js
 		end
	end

	private

	def project_params
		params.require(:project).permit(:title, :description)
	end
end
