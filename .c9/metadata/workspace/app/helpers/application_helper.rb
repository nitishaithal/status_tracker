{"filter":false,"title":"application_helper.rb","tooltip":"/app/helpers/application_helper.rb","undoManager":{"mark":0,"position":0,"stack":[[{"group":"doc","deltas":[{"start":{"row":6,"column":5},"end":{"row":7,"column":2},"action":"insert","lines":["","  "]},{"start":{"row":7,"column":2},"end":{"row":10,"column":5},"action":"insert","lines":["  def gravatar_url_for(user, size=\"200\")","    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)","    gravatar_url = \"https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}\"","  end"]},{"start":{"row":7,"column":2},"end":{"row":7,"column":4},"action":"remove","lines":["  "]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":0,"column":0},"end":{"row":0,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1426826015000,"hash":"7bc3b4eda5333dcdc1c6ac3e4cb36a9654283ea3"}