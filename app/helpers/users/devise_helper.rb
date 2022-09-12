module Users::DeviseHelper
    def devise_error_messages
        if resource.errors.present?
            error = resource.errors.first.attribute.to_s + "_" + resource.errors.first.type.to_s
            t("devise_errors.#{error}")
        end
    end
end
