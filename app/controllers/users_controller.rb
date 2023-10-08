class UsersController < ApplicationController
    def login
        user = User.find_by(email: params['email'])
        if user&.authenticate(params[:password])
            session[:user_id]=user.id
            render json: {id: user.id, email: user.email,  username: user.username, role: user.role, full_name: user.full_name}, status: :created
        else
            render json: {message: "invalid email or password"}, status: :unauthorized

        end
    end
end
