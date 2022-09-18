class UsersController < ApplicationController
    before_action :authenticate_user!

    def edit
        @user = User.find(current_user.id)
    end

end
