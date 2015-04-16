class IntentsController < ApplicationController
def create
	@intent = Intent.new(intent_params)
	#if the goal is able to save then redirect to the goals page
	if @intent.save
		redirect_to @intent
	else 
		render 'new'
	end
end

def new
	@intent = Intent.new
end

def show
	@intent = Intent.find(params[:id])	
end
def update
		if @intent.update(intent_params)
			redirect_to @goal
		else
			render 'edit'
		end
	end

	private

	def intent_params
		params.require(:intent).permit(:description, :status_intent, :milestone_id)
	end
end
