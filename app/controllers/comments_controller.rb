class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @spot = Spot.find(params[:spot_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to spot_path(params[:spot_id]), notice: 'コメントを投稿しました'
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :text).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end

end
