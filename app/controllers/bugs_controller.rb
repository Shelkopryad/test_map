class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update

  end
end
