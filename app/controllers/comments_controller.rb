class CommentsController < ApplicationController
  def index
  	@comments = Comment.with_p_name.all
  end

  def create_comment
  	# Comment.create(comment: params[:comment], products_id: params[:id])
  	Comment.create(comment_params)
    redirect_to :back
  end

private
  def comment_params
  	params.require(:commentform).permit(:comment, :product_id)
  end

end
