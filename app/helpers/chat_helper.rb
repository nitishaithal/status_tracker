module ChatHelper


def sto
	require "redis"
	redis = Redis.new
	keyis = "key"
	newmsg = params[:message]
	redis.append(keyis, newmsg);
	#redirect_to root_path

	#value = redis.get('foo');
	#puts value
  end

end
