module LikesHelper
    def show_like photo, user
        if photo.likes.find_by(user: user).present?
            image = "heart-fill.svg"
        else
            image = "heart.svg"
        end

        image_tag("icons/#{image}", size: "24", class: "like-button")
    end
end
