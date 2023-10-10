class CategoriesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :category_notfound
    rescue_from ActiveRecord::RecordInvalid,with: :validation
    def index
        render json: Category.all
    end
    def create
        category = Category.create!(category_params)
       if category
        render json: {id: category.id, category_name: category.category_name}, status: :created
       else
        render json: {message: "unable to create category"}, status: :internal_server_error

       end
    end
    def show
        category = Category.find(params[:id])
        render json: category
    end
    def update
        category = Category.find(params[:id])
        category.update!(category_params)
        render json: {message: "category updated"}
    end

    def destroy
        category = Category.find(params[:id])
        category.destroy
        render json: {message: "category deleted"}, status: :no_content
    end
    private

    def category_notfound
        render json: {message: "category does not exist"}, status: :not_found
    end

    def category_params
        params.permit(:category_name)
    end

    def validation(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
