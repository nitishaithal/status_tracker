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
	end
<<<<<<< HEAD
	
=======
>>>>>>> fb7f290fdfa7c51f296559f62bc7840816fbfc37
end
