class MilestonesController < ApplicationController
before_action :find_milestone, only: [:destroy]

def create
	@milestone = Milestone.new(milestone_params)
	#if the goal is able to save then redirect to the goals page
	if @milestone.save
		redirect_to @milestone.goal
	else 
		render 'new'
	end
end

def new
	@milestone = Milestone.new
end

def show
	@milestones = Milestone.all
	@intents = Intent.all
	@milestone = Milestone.find(params[:id])
	#redirect_to @milestone.goal
end
def update
	@milestone = Milestone.find(params[:id])
	@milestone.update_attributes(milestone_params)
	@milestone.save
	respond_to do |format|
	    format.html { redirect_to @milestone }
	    format.json { render :json => @milestone.to_json }
	end
end

def destroy
	@milestone.destroy
	redirect_to @milestone.goal
end
	private

	def milestone_params
		params.require(:milestone).permit(:description, :status_milestone, :est_time_milestone, :goal_id)
	end

	def find_milestone
		@milestone = Milestone.find(params[:id])
	end
end
