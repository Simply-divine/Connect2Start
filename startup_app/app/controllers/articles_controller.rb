class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
          flash[:success] = "Article successfully created"
          redirect_to articles_show(@article)
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    

    private
        def article_params
            params.require(:article).permit(:title,:description) 
        end

 
end