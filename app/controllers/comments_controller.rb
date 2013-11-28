class CommentsController < ApplicationController
  def index
  end

  def create
    @post = Post.find(params[:post_id])#first find the post upon which to comment
    @comment = #now, how to generate the comment's model
@post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to post_path(@post)
  end
end
