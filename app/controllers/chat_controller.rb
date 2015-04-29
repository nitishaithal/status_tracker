class ChatController < ApplicationController
 
  def start_conversation
  	@user=User.find(params[:id])
  	@key = " "
  	@message ="+"
  	if (@user.email  <=> current_user.email) < 0
  		@key = @user.email+"_@_"+current_user.email
  	else
  		@key = current_user.email+"_@_"+@user.email
  	end 
  	
  	@messages = $redis.get(@key)

  	render template: "projects/chat"

  end

def sto
	require "redis"
	redis = Redis.new
	keyis = params[:key]
	newmsg = params[:message]
	redis.append(keyis, newmsg);
	redirect_to root_path
  puts "the value of the key is: "
  puts params[:keys1]
	#value = redis.get('foo');
	#puts end
  #value
end

end
