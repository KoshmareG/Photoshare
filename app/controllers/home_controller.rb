class HomeController < ApplicationController
    before_action :authenticate_user!

    def show
        @photos = Photo.order(likes_count: :desc).where("created_at >= ?", 1.week.ago.utc).where.not(user_id: current_user.id)
    end
    
end
