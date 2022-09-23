class SubscribesController < ApplicationController
    def create
        user = User.find(params[:user_id])

        if current_user.subscribes.find_by(user_subscribe: user.id).present?
            current_user.subscribes.find_by(user_subscribe: user.id).destroy
            current_user.update(subscription_count: current_user.subscription_count - 1)
            user.update(followers_count: user.followers_count - 1)
        else
            current_user.subscribes.create(user_subscribe: user.id)
            current_user.update(subscription_count: current_user.subscription_count + 1)
            user.update(followers_count: user.followers_count + 1)
        end

        redirect_back(fallback_location: root_path)
    end
end
