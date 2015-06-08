class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @title =params[:flash][:title] unless params[:flash].nil?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
	end
   end

  def help
  end

  def about
  end

  def contact
  end

  def marumaru
    @title = "◯◯"
  end

  def ria
    redirect_to root_path :flash => {:title => "リア"}
  end

  def yami
    redirect_to root_path :flash => {:title => "病み"}
  end

  def sato
    redirect_to root_path :flash => {:title => "悟"}
  end

  def maji
    redirect_to root_path :flash => {:title => "発信"}
  end

end
