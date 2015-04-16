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
		@goal = Goal.new(goal_params)
		#if the goal is able to save then redirect to the goals page
		if @goal.save
			redirect_to @goal
		else 
			render 'new'
		end
	end

	def edit
		
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
		redirect_to root_path
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
