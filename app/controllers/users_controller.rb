class UsersController < ApplicationController
    def login
        user = User.find_by(email: params['email'])
    end
end
