class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to current_user
  end

  def destroy
  end

  private

    def post_params
      params.require(:posts).permit(:content, :question_id)
    end

end
