module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		if user.image
			user.image
		else
			"http://s.gravatar.com/avatar/9e69591c6be3ac1ff0d0f8eb30b7a297?s=150"
		end
	end

end
