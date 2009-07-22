class AhasController < ApplicationController
  
  
  def index
    @ahas = Aha.all
  end
  
  def show
    @aha = Aha.find(params[:id])
  end
  
  def new
    @aha = Aha.new
  end
  
  def create
    @aha = Aha.new(params[:aha])
    if @aha.save
      flash[:notice] = "Successfully created aha."
      redirect_to :back
    else
      render :action => 'new'
    end
  end
  
  def edit
    @aha = Aha.find(params[:id])
  end
  
  def update
    @aha = @page.aha.find(params[:id])
    if @aha.update_attributes(params[:aha])
      flash[:notice] = "Successfully updated aha."
      redirect_to :back
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @aha = Aha.find(params[:id])
    @aha.destroy
    flash[:notice] = "Successfully destroyed aha."
    redirect_to ahas_url
  end
end
