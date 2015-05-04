class ChatController < ApplicationController
 
  def start_conversation
    require "redis"    
  	@user=User.find(params[:id])
  	@key = " "
  	@message ="+"
  	if (@user.email  <=> current_user.email) < 0
  		@key = @user.email+"_@_"+current_user.email
  	else
  		@key = current_user.email+"_@_"+@user.email
  	end 
  	
  	@messages = $redis.get(@key).try(:split,";")

  	render template: "projects/chat"
      
  end

def create
	require "redis"
	redis = Redis.new
	keyis = params[:key]
	newmsg = params[:message]+";"
  @msg = params[:message]
  @user = current_user
	redis.append(keyis, newmsg);
  puts @newmsg
  @messages = $redis.get(@key).try(:split,";")
  redirect_to projects/chat
end

end
