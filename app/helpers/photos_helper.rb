module PhotosHelper
    def new_photo_error photo
        if photo.invalid?
            t("errors.new_photo.text_invalid")
        else
            t("errors.new_photo.photo_missing")
        end
    end
end
