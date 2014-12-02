class PostsController < ApplicationController


	def index
   @categories = Category.all

    @post = Post.new(params[:post])
# @posts = Post.paginate(:page => params[:page]).order('id DESC')

 @posts=Post.order("id DESC").page(params[:page]).per(10)
   # @posts = Post.all(:order => "created_at DESC")

   end
    respond_to do |format|
      format.html

    end

 def new
  @categories = Category.all
  @user=current_user
 @post = Post.new(params[:post])

 end
  def create
@categories = Category.all
   @post = Post.new(post_params)
    respond_to do |format|
      @post.user_id=current_user.id
      if @post.save!
!         format.html { redirect_to root_path }
        format.js
      else
        flash[:notice] = "Message failed to save."
        format.html { redirect_to root_path }
      end
    end
end
def post_params
      params.require(:post).permit(:body, :user_id, :category_id,:document)
    end
   def update
      @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
   @post = Post.find(params[:id])
    @post.destroy
   redirect_to :back, :notice => "Your post has been deleted successfully."
    
  end
end
