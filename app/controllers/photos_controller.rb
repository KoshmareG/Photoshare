class PhotosController < ApplicationController
    before_action :authenticate_user!

    before_action do
        ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    end

    def index
        @posts = Photo.includes(:user).where(user_id: current_user.subscribes.pluck(:user_subscribe)).order(created_at: :desc)
    end

    def show
        @photo = Photo.includes(:user, :comments).find(params[:id])
    end

    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.user_id = current_user.id     

        if @photo.images.attached? && @photo.valid?
            @photo.save

            hashtags = helpers.hashtag_parser photo_params[:text]
            hashtags.each { |hashtag| @photo.hashtags.create(text: hashtag.downcase) }

            redirect_to @photo
        else
            flash[:alert] = helpers.new_photo_error @photo
            render action: "new", status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def photo_params
        params.require(:photo).permit(:text, images: [])
    end
end
