module HomeHelper
  def post_comments(post)
    case post.comments.size
    when 0 then "#{t("home_page.new_comment")}"
    else "#{t("home_page.show_all_comments")} (#{post.comments.size.to_s})"
    end
  end
end
