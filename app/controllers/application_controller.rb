class ApplicationController < ActionController::API
    include ActionController::Cookies
    def check_role
        if session[:user_id].nil?
            render json: { message: 'You are not logged in'}, status: :unauthorized
        else
            @current_user = User.find(session[:used_id])
            if @current_user && @current_user.role != 'admin'
                render json: { message: 'You are not allowed to perform this action'}, status: :unauthorized 
    
            end
        end
        
        # render json: {user: session[:user_id]}
    end
end
