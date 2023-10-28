class ContentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid,with: :validation
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :set_content, only: [:show, :edit, :update, :destroy, :approve_reject_flag]
    

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
    def update
        ActiveRecord::Base.transaction do
            @content.update(content_params)
            @content.contentmedia.destroy_all
            params[:content_urls].each do |url|
              content_media= ContentMedium.create!(content_id: content.id, link: url)
            end
        end
    end
    def destroy
        @content.destroy
        head :no_content
    end

    def show
        render json: @content
    end
    def show_pending
        pending = Content.where(status: "pending")
        render json: pending
    end
    def approve_reject_flag
        if @content.update!(status: params[:status])
            render json: @content, status: :ok
        end
    end
    
    private 
    def set_content
        @content = Content.find(params[:id])
    end

    def record_not_found
        render json: {error: "Content not found"},status: :not_found
    end

    def content_params
        params.permit(:title, :body, :category_id, :user_id, :content_urls, :content_type, :status)
    end
    def validation(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
