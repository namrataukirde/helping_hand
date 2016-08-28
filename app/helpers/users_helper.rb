module UsersHelper

    #Return gravatar picture
    def gravatar_for(user, size)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        # s = options[:size]
        gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, class: "gravatar img-circle gravatar")
    end
end
