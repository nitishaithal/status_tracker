class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def index
		#@user = User.all	
		#@user=User.paginate(:page => params[:page], :per_page => 30)
		@users = User.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	end
	def new
		@user = current_user
		@projects = @user.projects
		if @user.title == nil
			user_signed_in = true
			redirect_to :controller => 'devise/registrations', :action =>'edit'
		end
	end
	def show
		@user = User.find(params[:id])
	end
	def search_users
		@users = User.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
		@project = Project.find(params[:project_id])
		render :layout => false
	end
end
