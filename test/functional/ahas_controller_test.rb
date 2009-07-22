require 'test_helper'

class AhasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Aha.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Aha.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Aha.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to aha_url(assigns(:aha))
  end
  
  def test_edit
    get :edit, :id => Aha.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Aha.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Aha.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Aha.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Aha.first
    assert_redirected_to aha_url(assigns(:aha))
  end
  
  def test_destroy
    aha = Aha.first
    delete :destroy, :id => aha
    assert_redirected_to ahas_url
    assert !Aha.exists?(aha.id)
  end
end
