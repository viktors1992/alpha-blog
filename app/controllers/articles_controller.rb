class ArticlesController < ApplicationController
    def show
        
        @article = Article.find(params[:id])
    end
    def index
        @articles = Article.all
    end
    def new
       @article = Article.new 
    end
    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        #render plain: @article.inspect
        if @article.save
            flash[:notice] = "Successfully created"
            redirect_to @article #article_path(@article) 
        else 
            render 'new'
        end
        
    end
end