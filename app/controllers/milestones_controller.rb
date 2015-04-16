class MilestonesController < ApplicationController

def create
	@milestone = Milestone.new(milestone_params)
	#if the goal is able to save then redirect to the goals page
	if @milestone.save
		redirect_to @milestone
	else 
		render 'new'
	end
end

def show
	@milestones = Milestone.all
	@intents = Intent.all
	@milestone = Milestone.find(params[:id])
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
	private

	def milestone_params
		params.require(:milestone).permit(:description, :status_milestone, :est_time_milestone, :goal_id)
	end
end
