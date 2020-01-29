class CommentsController < ApplicationController
    before_action :find_commentable
    before_action :require_login
    before_action :require_ad_mod_curr, :only => [:destroy]
    respond_to :js, :html, :json
  def require_login
    unless current_user != nil
    flash[:error] =  "DEVI EFFETTUARE L'ACCESSO PER VISUALIZZARE I FILM"
      redirect_to new_user_session_path # halts request cycle
    end
  end

  def new
      @comment = Comment.new  
  end

  def create
      @comment = @commentable.comments.new comment_params
      @comment.username = current_user.username
      if @comment.save
          redirect_back fallback_location: root_path, notice: "commento postato"
          ahoy.track "Commento postato", language: "Ruby"
      else
          redirect_back fallback_location: root_path
        end
  end

  def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      redirect_back fallback_location: root_path, notice: "commento eliminato"
      ahoy.track "Commento Eliminato", language: "Ruby"
  end     

  def like
    @comment = Comment.find(params[:id])
    if current_user.voted_for? @comment
        @comment.unliked_by current_user
        ahoy.track "Like", language: "Ruby"
        redirect_back fallback_location: root_path, notice: "Hai tolto 'Mi Piace' dal commento ''"+ @comment.body + "'' di " + @comment.username+"."  
    else
      @comment.liked_by current_user
      ahoy.track "Dislike", language: "Ruby"
      redirect_back fallback_location: root_path, notice: "Hai messo 'Mi Piace' al commento ''"+ @comment.body + "'' di " + @comment.username+"."  
    end
  end

  private
  def comment_params
      params.require(:comment).permit(:body)
  end

  def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Film.find_by_id(params[:film_id]) if params[:film_id]
      @commentable = Tv.find_by_id(params[:tv_id]) if params[:tv_id]
  end

  private 

  def require_ad_mod_curr
    unless Comment.find(params[:id]).username == current_user.username || current_user.role == "A" || current_user.role == "M"
      flash[:alert] =  "Per accedere a questa pagina devi essere amministatore o moderatore."
        redirect_to root_path # halts request cycle
    end
  end
end
