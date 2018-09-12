class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)

  def create
    @micropost = current_user.microposts.build micropost_params
    
    if @micropost.save
      flash[:success] = t(".micropost_create")
      redirect_to root_url
    else
      @feed_items = current_user.feed.page(params[:page])
                                .per Settings.users_controller.page_number
      render "static_pages/home"
    end
  end

  def destroy; end

  private

  def micropost_params
    params.require(:micropost).permit :content
  end
end
