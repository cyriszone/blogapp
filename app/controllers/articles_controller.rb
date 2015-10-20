class ArticlesController < ApplicationController

  #all this method is performed automatically by URI Pattern! zone

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect

    #@article = Article.new(params[:article])
    #Article.new should use STRONG PARAMETERS rule to enhance robustness and security.
    @article = Article.new(article_params)

    #filter the .text
    passcode = "13709394"
    if passcode.to_s == @article.text[0..passcode.size-1]
      @article.text = @article.text[passcode.size..@article.text.size-1]
      @article.save
    end
    redirect_to articles_path

    #if @article.save  #returns a boolean indicating whether the article was saved or not.
      #redirect_to @article
    #  redirect_to articles_path
    #else
      #render 'new' #??? why back to new with temp inputs?
    #  redirect_to articles_path
    #end


    #render plain: @article.inspect
    #>> #<Article id: 4, title: "3", text: "tt reder @article\r\n\r\n", created_at: "2015-08-13 12:40:00", updated_at: "2015-08-13 12:40:00">
    #redirect_to @article #??? why is #show action?

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article= Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end


  def show
    @article = Article.find(params[:id])

  end

  def index
    @articles = Article.all
    @article = Article.new
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end



  private
    def article_params
      params.require(:article).permit(:title, :text)
    end


end
