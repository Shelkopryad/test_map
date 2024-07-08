class ComponentsController < ApplicationController
  def index
    all_components
  end

  def show
    @component = Component.find(params[:id])
  end

  def new
    @component = Component.new
  end

  def create
    component = Component.new(component_params)
    if component.save
      redirect_to components_path
    else
      redirect_to new_component_path
    end

  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy
    redirect_to components_path
  end

  private
  def component_params
    params.require(:component).permit(:name).merge(to_test: false)
  end
end
