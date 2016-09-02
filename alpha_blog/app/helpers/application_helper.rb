module ApplicationHelper

  def gravatar_for(user)
    gravater_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravater_id}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

end
