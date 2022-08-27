class CommentsController < ApplicationController
  def create
    if Current.user
      @comment = Current.user.comments.new(comment_params)
      if @comment.save
        redirect_to post_item_path(params[:id]), notice: "Comment uploaded successfully"
      end
    else
      flash[:warning] = "You need to be signed in!"
      redirect_to post_item_path(params[:id])
    end
  end

  def delete
    @comment = Current.user.comments.find(params[:id])
    if Current.user
      @comment.destroy
      flash[:warning] = "Your comment has been deleted!"
      redirect_to post_item_path(params[:id])
    else
      flash[:warning] = "You need to be signed in!"
      redirect_to post_item_path(params[:id])
    end
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(user_id: Current.user.id, post_id: params[:id])
  end
end
