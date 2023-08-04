class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show,:edit,:update,:destroy]
    
    def show
        # binding.break
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article was added successfully"
            redirect_to article_path(@article)
        else
            flash[:error] = @article.errors.full_messages.join(",\n")
            redirect_to new_article_path
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            flash[:error] = @article.errors.full_messages.join(' /n')
            redirect_to edit_article_path 
        end
    end
    
    def destroy
        if @article.destroy
            redirect_to articles_path
        else
        end
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end