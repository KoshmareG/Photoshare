class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @photos = Photo.where(user_id: params[:id]).order(created_at: :desc)
    end

end
