module UsersHelper
  def gravatar_for user, size: Settings.gra_size
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    gravatar_url = Settings.gravatar_url
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end
end
