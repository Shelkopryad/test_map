class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
  end

  def create
    bug = Bug.new(bug_params)
    bug.component = Component.find_by(name: params['bug']['component'])

    tags = []
    params['bug']['tags'].split(',').map(&:strip).each do |tag|
      unless Tag.exists?(name: tag)
        new_tag = Tag.create(name: tag)
        tags << new_tag
      end
    end

    if bug.save
      bug.tags += tags
      redirect_to bugs_path
    else
      redirect_to new_bug_path
    end
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update

  end

  private
  def bug_params
    params.require(:bug).permit(:name, :jira_link)
  end
end
