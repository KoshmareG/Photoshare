module Users::DeviseHelper
    def devise_error_messages
        if resource.errors.present?
            error = resource.errors.full_messages.first.split(".")[-2..-1].join("_")
            t("devise_errors.#{error}")
        end
    end
end
