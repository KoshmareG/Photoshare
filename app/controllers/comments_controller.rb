class CommentsController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(text: comment_params[:text], parent_id: comment_params[:parent], user_id: current_user.id)

    if @comment.valid?
      @comment.save
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :parent)
  end

end
