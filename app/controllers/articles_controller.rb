class ArticlesController < ApplicationController
  #aggiungo un metodo di sicurezza per aggiunge articoli o editarli, eccezion fatta per l'elencazione o lo show del singolo articolo
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  #utiliziamo @article perchè crea una variabile di istanza, rails passa tutte le variabili di istanza generate, anche da
  #altri file, al "view"
  def index #elenca tutte le istanze di articoli (aka tutti gli articoli)
    @articles = Article.all
  end

  def show  #cerca gli articoli per id
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new  #crea una variabile di istanza generale
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #crea un articolo (Article fa riferimento alla classe dentro article.rb) e
    #gli passa gli attributi di article_params
    @article = Article.new(article_params) #acchiappa la variabile di istanza di new e gli schiaggo un articolo dentro

    #@article.save => restituisce un booleano che ci indica se è stato salvato oppure no l'articolo
    if @article.save #se l'articolo rispetta i vincoli del modello
      redirect_to @article #salvalo
    else
      render 'new'
    end
    #render plain: params[:article].inspect -> creava l'oggetto secco dal controllore
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params   #mi semplifico la vita usando un metodo privato per i parametri
    params.require(:article).permit(:title, :text)  #params accetta solo oggetti di tipo "article"
  end
end
