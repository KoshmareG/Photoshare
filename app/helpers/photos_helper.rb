module PhotosHelper
    def new_photo_error(photo)
        if photo.invalid?
            t("errors.new_photo.text_invalid")
        else
            t("errors.new_photo.photo_missing")
        end
    end

    def show_all_photo(photo)
        link_to (image_tag(photo.images.first.variant(resize_to_fill: [700, 700]))), photo_path(photo), data: {turbo: false}, style: "display: flex"
    end

    def text_parser(string)
        hashtag_rule = /(#[[:word:]]+)/
        text = []

        string.split(hashtag_rule).each do |word|
            if word.match?(hashtag_rule)
                text << "<a href='#{root_url}'>" + word + "</a>"
            else
                text << word
            end
        end
        text.join.html_safe
    end

    def hashtag_parser(text)
        text.scan(/#[[:word:]]+/).uniq
    end
end
