class CommentsController < ApplicationController
    before_action :find_commentable
    before_action :require_login
 
 
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
            puts("ID: "+@comment.id.to_s)
            @user = current_user.username
            puts("UTENTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE: "+@user)
        else
            redirect_back fallback_location: root_path
          end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_back fallback_location: root_path, notice: "commento eliminato"
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

end
