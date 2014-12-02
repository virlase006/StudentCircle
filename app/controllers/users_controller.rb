class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #  @users = @user.following.paginate(:page => params[:page])

   
  end
  def following
    @title = "Following"
    @user = User.find(params[:id])
    #@users = @user.following.paginate(:page => params[:page])


    @users=@user.following.page(params[:page]).per(10)
    render 'following'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])

    @users=@user.followers.page(params[:page]).per(10)
    render 'followers'
  end

  def index
    @users = User.search(params[:search])
  end

end
