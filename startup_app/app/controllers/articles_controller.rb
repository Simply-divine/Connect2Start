class ArticlesController < ApplicationController
        before_action :set_article, only: [:edit,:update,:show,:destroy]
        before_action :require_user, except: [:show, :index]
        before_action :require_same_user, only: [:edit,:update,:delete]
    def new
        @article = Article.new
    end

    def index 
        @articles = Article.all
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
          flash[:success] = "Article successfully created"
          redirect_to article_path(@article)
        else
        #   flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def show
    end

    def edit
    end
    
    def update
        if @article.update(article_params)
            flash[:success] = "Article successfully updated"
            redirect_to article_path(@article)
        else
          #   flash[:error] = "Something went wrong"
            render 'edit'
        end
    end
    def destroy
        @article.destroy
        flash[:danger] = "Article successfully deleted"
        redirect_to articles_path
    end
    private
        def set_article
            @article = Article.find(params[:id]);
        end
        
        def require_same_user
            if current_user != @article.user
                flash[:danger] = "You can edit your own articles only"
                redirect_to root_path
            end
        end
        
        def article_params
            params.require(:article).permit(:title,:description) 
        end


 
end