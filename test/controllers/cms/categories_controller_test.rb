require_relative '../../test_helper'

class Cms::CategoriesControllerTest < ActionController::TestCase

  def test_render_json_index
    cat = Cms::Category.last
    get :index, :format => :json, :use_route => :sites
    assert_response :success
    assert_equal 'application/json', response.content_type

    json = JSON.parse(response.body)
    assert_equal json.first['label'], cat.label
    assert_equal json.length, 1
  end

  def test_render_json_show
    cat = Cms::Category.last
    get :show, :format => :json, :id => cat.id, :use_route => :sites
    assert_response :success
    assert_equal 'application/json', response.content_type

    json = JSON.parse(response.body)
    assert_equal json['label'], cat.label
  end
end
