class StaticPagesController < ApplicationController
  
def Home
  if signed_in?
  	@user=current_user

 # @posts=Post.all.paginate(:page => params[:page]).order('id DESC')
   @posts=Post.order("id DESC").page(params[:page]).per(10)
@feed_items = current_user.feed.order('id DESC').page(params[:page]).per(10)

@cats= Category.all
  end
end
  def Help
  end
end
