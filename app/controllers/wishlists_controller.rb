class WishlistsController < ApplicationController
    def create
        wishlist= Wishlist.create!(wishlist_params)
       if wishlist
        render json: wishlist, status: :created
       else
        render json: {message: "unable to create wishlist"}, status: :internal_server_error

       end
    end
    
    def destroy
        @wishlist=Wishlist.find(params[:id])
        if @wishlist
            @wishlist.destroy
            head :no_content
        else
            render json: {message: "wishlist not found"}, status: :not_found 
        end
       

    end
end
