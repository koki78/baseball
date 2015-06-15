class StaticPagesController < ApplicationController
  def home
    @title = "◯◯"
  	if signed_in?
      @title =params[:flash][:title] unless params[:flash].nil?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.where(category: @title).paginate(page: params[:page])
	 end
  end

  def help
    @title = "◯◯"
  end

  def about
    @title = "◯◯"
  end

  def contact
    @title = "◯◯"
  end

  def marumaru
    @title = "◯◯"
  end

  def ria
    redirect_to root_path :flash => {:title => "リア"}
  end

  def yami
    redirect_to root_path :flash => {:title => "愚痴"}
  end

  def sato
    redirect_to root_path :flash => {:title => "悟"}
  end

  def maji
    redirect_to root_path :flash => {:title => "発信"}
  end

end
