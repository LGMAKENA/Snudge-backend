class ContentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid,with: :validation
    
    def index
        render json: Content.all 
    end
    def create
        ActiveRecord::Base.transaction do
            content= Content.create!(content_params)
            if content
               params[:content_urls].each do |url|
                content_media= ContentMedium.create!(content_id: content.id, link: url)
               end
            else
                render json: {message: "unable to create content"}, status: :internal_server_error
            end
            render json: content, status: :created
        end
    end
    
    private 
    def content_params
        params.permit(:title, :body, :category_id, :user_id, :content_urls)
    end
    def validation(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
