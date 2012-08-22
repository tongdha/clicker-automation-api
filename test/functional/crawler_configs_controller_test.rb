require 'test_helper'

class CrawlerConfigsControllerTest < ActionController::TestCase
  setup do
    @crawler_config = crawler_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crawler_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crawler_config" do
    assert_difference('CrawlerConfig.count') do
      post :create, crawler_config: {  }
    end

    assert_redirected_to crawler_config_path(assigns(:crawler_config))
  end

  test "should show crawler_config" do
    get :show, id: @crawler_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crawler_config
    assert_response :success
  end

  test "should update crawler_config" do
    put :update, id: @crawler_config, crawler_config: {  }
    assert_redirected_to crawler_config_path(assigns(:crawler_config))
  end

  test "should destroy crawler_config" do
    assert_difference('CrawlerConfig.count', -1) do
      delete :destroy, id: @crawler_config
    end

    assert_redirected_to crawler_configs_path
  end
end
