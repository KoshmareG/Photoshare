class PhotosController < ApplicationController
    before_action :authenticate_user!

    before_action do
        ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    end

    def index
    end

    def show
    end

    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.user_id = current_user.id

        if @photo.images.attached? && @photo.valid?
            @photo.save
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
