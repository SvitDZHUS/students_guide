# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      @users = authorize User.all_except(current_user)
    end

    def show
      @user = authorize User.find(params[:id])
      @profile = @user.profile
    end
  end
end
