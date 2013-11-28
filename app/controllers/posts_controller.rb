class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text))
# makes a new post model (doesn't save!) and checks for something in :title and :text rows

    if @post.save
  # saving the model in the database
      redirect_to @post
  # redirects uer to the 'show' action (defined later)
    else
      render 'new' # render rather than redirect to use the same @post object
    end

    def edit
      @post = Post.find(params[:id])
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  private
# private prevents a cracker from setting the model's attributes by
# manipulating the hash passed to the model by changing the slug
    def post_params
      params.require(:post).permit(:title, :text)
    end

end
