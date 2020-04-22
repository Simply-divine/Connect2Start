class CategoriesController < ApplicationController
    before_action :set_category, only: [:edit,:show,:update,:destroy]
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create 
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Category Successfully created"
            redirect_to category_path(@category)
        else
            render 'new'
        end
    end
    
    def show
    end

    def edit
    end

    def update
        if @category.update(category_params)
            flash[:success] = "Category successfully updated"
            redirect_to category_path(@category)
        else
            render 'new'
        end
    end

    def destroy
        @category.destroy
        flash[:danger] = "Category successfully deleted"
        redirect_to categories_path
    end
     
    private
        def category_params    
            params.require(:category).permit(:name)
        end
        def set_category
           @category = Category.find(params[:id])         
        end
end