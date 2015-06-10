class MicropostsController < ApplicationController
  before_action :signed_in_user, only:[:create, :destroy]
  before_action :correct_user,  only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)

    logger.debug "-------------------------------------------------------------"
    logger.debug @micropost
    logger.debug("******")
    logger.debug(params[:micropost][:category])
    logger.debug("******")
    logger.debug @micropost.id
    logger.debug @micropost.content
    logger.debug @micropost.category
    logger.debug "-------------------------------------------------------------"
    
    if @micropost.save
      flash[:success] = "Micropost created!"
      @title = params[:micropost][:category]
      redirect_to root_path :flash => {:title => "#{@title}"}
      

      # if {action: :ria} @maru ="ria" 
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    logger.debug "-------------------------------------------------------------"
    logger.debug @micropost
    logger.debug("******")
    logger.debug(params[:cat_name])
    logger.debug("******")
    logger.debug @micropost.id
    logger.debug @micropost.content
    logger.debug @micropost.category
    logger.debug "-------------------------------------------------------------"
    
    @title = @micropost.category
    @micropost.destroy




    redirect_to root_path :flash => {:title => "#{@title}"}
    
      # redirect_to root_path :notice => {:title => "#{@title}"}
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content,:category)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end