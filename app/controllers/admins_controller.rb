class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:notice] = "Successfully created admin."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      flash[:notice] = "Successfully updated admin."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
