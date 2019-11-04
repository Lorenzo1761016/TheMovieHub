class FilmController < ApplicationController
  def index
    @results = Film.search(params[:result])
  end
  def create
   
  end
end