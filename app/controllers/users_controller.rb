class UsersController < ApplicationController
    before_action :authorized, only: [:index, :update, :auto_login]

    def index
        @users = User.all
        render json: {users: @users}, status: :ok
    end

    # SIGNING UP
    def create
        @user = User.create(user_params)
        if @user.valid?
          token = encode_token({user_id: @user.id})
          render json: {token: token}
        else
          render json: {errors: @user.errors.full_messages}
        end
    end

    # LOGGIN IN
    def login
        @user = User.find_by(email: params[:email])

        if @user && @user.password == params[:password]
          token = encode_token({user_id: @user.id})
          render json: {token: token}
        else
          render json: {error: "Invalid email or password"}
        end
    end

    # UPDATE USER NAMES
    def update
        if @user.update(user_update_params)
            render json: {}
        else
            render json: {errors: @user.errors.full_messages}
        end
      end


    private

    def user_params
        params.permit(:firstName, :lastName, :email, :password)
    end

    def user_update_params
        params.permit(:firstName, :lastName)
    end
end
