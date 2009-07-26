class FaqsController < ApplicationController
  
  def sort
    params[:faqs].each_with_index do |id, index|
      Faq.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  
  def index
    @faqs = Faq.all(:order => "position")
    respond_to do |format|
    format.html
    format.xml
    format.js

  end

  end
  
  def show
    @faq = Faq.find(params[:id])
  end
  
  def new
    @faq = Faq.new
  end
  
  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      flash[:notice] = "Successfully created faq."
      redirect_to faqs_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @faq = Faq.find(params[:id])
  end
  
  def update
    @faq = Faq.find(params[:id])
    if @faq.update_attributes(params[:faq])
      flash[:notice] = "Successfully updated faq."
      redirect_to faqs_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    flash[:notice] = "Successfully destroyed faq."
    redirect_to faqs_url
  end
  
  
  
end
