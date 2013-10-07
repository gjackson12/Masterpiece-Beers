module ApplicationHelper
  def fb_avatar_url(user)
    "http://graph.facebook.com/#{user}/picture"
  end

  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(current_user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=50"
  end

  def vote_count_display(obj)
    vote_count = Vote.score(@beer_label)
    html_class = "vote-count"

    if vote_count > 0
      html_class += " vote-count-positive"
    elsif vote_count < 0
      html_class += " vote-count-negative"
    end

    content_tag(:span, vote_count, class: html_class)
  end
end
