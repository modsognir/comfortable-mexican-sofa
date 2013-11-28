module Cms
  class CategoriesController < Cms::BaseController
    respond_to :json

    def index
      respond_with @cms_site.categories
    end

    def show
      respond_with @cms_site.categories.find(params[:id])
    end
  end
end