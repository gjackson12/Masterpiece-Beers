module ApplicationHelper
  def avatar_url(user) 
    "http://graph.facebook.com/#{user}/picture"
  end 
end
