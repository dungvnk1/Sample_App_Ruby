class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.includes(:image_attachment).build
      @feed_items = current_user.feed.includes(:image_attachment).order_by_time.paginate(page: params[:page])
    end
  end

  def help; end
      
  def about; end

  def contact; end
end
