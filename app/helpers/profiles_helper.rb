module ProfilesHelper
    def user_error_messages user
        if user.errors.present?
            error = user.errors.first.attribute.to_s + "_" + user.errors.first.type.to_s
            t("edit_profile.errors.#{error}")
        end
    end

    def show_user_avatar user, size
        if user.avatar.attached?
            image_tag(user.avatar.variant(resize_to_fill: [size, size]), class: "user-avatar")
        else
            image_tag("default_avatar.png", size: "#{size}", class: "user-avatar")
        end
    end
end
