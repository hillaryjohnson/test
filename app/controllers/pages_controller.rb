class PagesController < ApplicationController
  before_filter :require_admin, :except => [:index]
  
  def index
    @pages = Page.paginate :per_page => 1, :page => params[:page], :order => 'position'
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to pages_url
  end
  
  def list
    @pages = Page.all(:order => "position")
  end
  
  def sort
    params[:pages].each_with_index do |id, index|
      Page.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
end


