module SubscribesHelper
    def subscribe_button user
        if current_user.subscribes.find_by(user_subscribe: user.id).present?
            name = t("profile.unsubscribe")
            class_style = "button is-small"
        else
            name = t("profile.subscribe")
            class_style = "button is-small is-info" 
        end

        button_to name, user_subscribes_path(user), class: class_style
    end
end
