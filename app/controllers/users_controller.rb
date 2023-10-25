class UsersController < ApplicationController
    # before_action :check_role, only: [:index, :create]
    rescue_from ActiveRecord::RecordInvalid,with: :validation

    skip_before_action :authorized, only: :create

    def login
        user = User.find_by(email: params['email'])
        if user&.authenticate(params[:password])
            session[:user_id]=user.id
            render json: {id: user.id, email: user.email,  username: user.username, role: user.role, full_name: user.full_name}, status: :created
        else
            render json: {message: "invalid email or password"}, status: :unauthorized

        end
    end

    def show
        current_user = User.find{session[:user_id]}
        render json: current_user
    end

    def index 
        @users = User.all
        render json: @users, except: [:password_digest, :created_at,:updated_at]
    end
    def create
        user = User.create!(user_params)
       if user
        render json: {id: user.id, email: user.email,  username: user.username, role: user.role, full_name: user.full_name}, status: :created
       else
        render json: {message: "unable to create user"}, status: :internal_server_error

       end
    end
    def deactivate
        user = User.find(params[:id])
        if user
            user.update!(deactivate_params)
            render json: {message: "User deactivated"}
        else
            render json: {message: "User not found"}, status: :not_found
        end

    end

    def create
        user = user.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: (error: (login: "Invalid username or password")), status: :unauthorized
    end

    private

    def user_params
        params.permit(:email, :role, :full_name, :password, :username)
    end

    def deactivate_params
        params.permit(:deactivated)
    end
    def validation(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
 end
