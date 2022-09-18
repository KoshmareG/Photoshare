module ProfilesHelper
    def user_error_messages user
        if user.errors.present?
            error = user.errors.first.attribute.to_s + "_" + user.errors.first.type.to_s
            t("edit_profile.errors.#{error}")
        end
    end

    def show_user_avatar user, size

    end
end
