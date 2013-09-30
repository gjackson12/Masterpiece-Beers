module ApplicationHelper
  def fb_avatar_url(user) 
    "http://graph.facebook.com/#{user}/picture"
  end

  def gravatar_url(user)  
    gravatar_id = Digest::MD5::hexdigest(current_user.email).downcase 
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=50"  
  end 
end
