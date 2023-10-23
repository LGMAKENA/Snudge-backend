class CommentParentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :set_content, only: [:show, :update, :destroy]
    def create
        comment= CommentParent.create!(comment_params)
       if comment
        render json: comment, status: :created
       else
        render json: {message: "unable to create comment"}, status: :internal_server_error

       end
    end
    def update
        if @comment.update(comment_params)
            render json: @comment 
        end
    end
    def destroy
        @comment.destroy
        head :no_content
    end
    private 
    def comment_params
        params.permit(:user_id,:comment).merge(content_id: params[:id])

    end
    def set_content
        @comment = CommentParent.find(params[:id])
    end
    def record_not_found
        render json: {error: "Comment not found"},status: :not_found
    end

end
