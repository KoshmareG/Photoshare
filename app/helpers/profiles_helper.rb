module ProfilesHelper
    def user_error_messages user
        if user.errors.present?
            error = user.errors.first.attribute.to_s + "_" + user.errors.first.type.to_s
            t("edit_profile.errors.#{error}")
        end
    end

    def show_user_avatar user, size, add_class = ""
        add_class = " " + add_class if add_class.present?

        if user.avatar.attached?
            image_tag(user.avatar.variant(resize_to_fill: [size, size]), class: "user-avatar#{add_class}")
        else
            image_tag("default_avatar.png", size: "#{size}", class: "user-avatar#{add_class}")
        end
    end

    def photo_count posts
        " " + t("post_var.#{declension posts.size}").downcase
    end

    def link_creator user
        if @user.website.present?
            link = link_parser @user.website
            link_to link, "http://#{link}"
        else
            nil
        end
    end

    def link_parser link
        replacement_ruls = { "http://" => "", "https://" => "", "www." => "", "http://www." => "", "https://www." => "" }
        matcher = /#{replacement_ruls.keys.join("|")}/
       link.gsub(matcher, replacement_ruls)
    end
end
