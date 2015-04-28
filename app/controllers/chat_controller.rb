class ChatController < ApplicationController
 
  def start_conversation
  	@usr=User.find(params[:id])
  	render template: "projects/chat"
  end

end
