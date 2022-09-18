class UsersController < ApplicationController
    before_action :authenticate_user!

    def edit
        @user = User.find(current_user.id)
    end

    def update
        @user = User.find(current_user.id)
        
        if @user.update(user_params)
            flash[:notice] = t("edit_profile.success_save")
            render action: "edit", status: :unprocessable_entity
        else
            flash[:notice] = helpers.user_error_messages @user
            render action: "edit", status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :gender, :birthday, :website, :bio)
    end

end
