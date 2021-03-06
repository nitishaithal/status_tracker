class GoalsController < ApplicationController
	before_action :find_goal, only: [ :show, :edit, :update, :destroy]
	before_action :find_project, only: [:index, :new]
	
	def index
		@goals = Goal.all
		@usr=User.find(params[:id])
	end
	
	def show
		@milestones = Milestone.all
		@goal = Goal.find(params[:id])
		@intents = Intent.all
	end

	def new
		@goal = Goal.new	
	end
	
	def create
		@goal = Goal.create(goal_params)
		respond_to do |format|
		    format.html { redirect_to @goal }
		    format.json { render :json => @goal.to_json }
  		end
	end

	def edit
		redirect_to @goal
	end

	def update
		if @goal.update(goal_params)
			redirect_to @goal
		else
			render 'edit'
		end
		
	end

	def destroy
		@goal.destroy
		redirect_to @goal
	end

	private

	def goal_params
		params.require(:goal).permit(:description, :status_goal, :est_time_goal, :user_id, :project_id)
	end

	def find_goal
		#define the goal
		@goal = Goal.find(params[:id])
	end

	def find_project
		@project=Project.find(params[:project_id])
	end
end
