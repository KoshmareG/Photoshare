module PhotosHelper
    def new_photo_error photo
        if photo.invalid?
            t("errors.new_photo.text_invalid")
        else
            t("errors.new_photo.photo_missing")
        end
    end

    def show_all_photo photo
        link_to (image_tag(photo.images.first.variant(resize_to_fill: [700, 700]))), photo_path(photo), style: "display: flex"
    end
end
