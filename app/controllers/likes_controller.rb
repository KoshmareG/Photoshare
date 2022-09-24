class LikesController < ApplicationController
    def index
        
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
