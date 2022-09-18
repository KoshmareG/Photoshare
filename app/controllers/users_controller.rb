class UsersController < ApplicationController
    before_action :authenticate_user!

    before_action do
        @user = User.find(current_user.id)
    end

    def edit
    end

    def update
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
        params.require(:user).permit(:name, :gender, :birthday, :website, :bio, :avatar)
    end

end
