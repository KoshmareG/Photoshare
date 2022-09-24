class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @likes = Like.includes(:user, :photo).where(photo_id: Photo.where(user_id: current_user.id)).order(created_at: :desc)
    end

    def create
        photo = Photo.find(params[:photo_id])

        if photo.likes.find_by(user: current_user).present?
            photo.likes.find_by(user: current_user).destroy
            photo.update(likes_count: photo.likes_count - 1)
        else
            photo.likes.create(user: current_user)
            photo.update(likes_count: photo.likes_count + 1)
        end

        redirect_back(fallback_location: root_path)
    end
end
