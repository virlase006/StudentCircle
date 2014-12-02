class CommentsController < ApplicationController
def new
@comment= Comment.new
@post=Post.find(params[:post_id])

end

def create

@comment=Comment.new(comment_params)

  @comment.author=current_user
  @comment.post =Post.find(params[:post_id])
   @comment.save
    redirect_to root_path

end
def index
	@postC=Post.find(params[:post_id]);

	end
     def update
      @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to root_path, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
def destroy
   @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
def comment_params
params.require(:comment).permit(:body, :post_id,  :author_id)
end
end

