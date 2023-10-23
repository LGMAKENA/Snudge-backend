class CommentParentsController < ApplicationController
    def create
        comment= CommentParent.create!(comment_params)
       if comment
        render json: comment, status: :created
       else
        render json: {message: "unable to create comment"}, status: :internal_server_error

       end
    end
    private 
    def comment_params
        params.permit(:user_id,:comment).merge(content_id: params[:id])

    end
    def set_content
        @comment = CommentParent.find(params[:id])
    end
end
