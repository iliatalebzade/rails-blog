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

  private

  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(user_id: Current.user.id, post_id: params[:id])
  end
end
