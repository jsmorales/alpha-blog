module ApplicationHelper

	def gravatar_for(user_objt, options = { size: 80 })
		gravatar_id = Digest::MD5::hexdigest(user_objt.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user_objt.username, class: "img-thumbnail")
	end

end
