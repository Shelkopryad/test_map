class ComponentsController < ApplicationController
  def index
    all_components
  end

  def show
    @component = Component.find(params[:id])
  end
end
