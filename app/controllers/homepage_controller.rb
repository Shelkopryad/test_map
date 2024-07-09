class HomepageController < ApplicationController
  def index
    @result = {}
    components = Component.all
    components.each do |component|
      @result[component] = {
        bugs: component.bugs.size,
        test_cases: component.test_cases.size
      }
    end
    @result
  end

  def search
    @result = {}
    tags_from_query = params['query'].split(',').map { |it| it.strip }
    tags_from_query.each do |tfq|
      tag = Tag.find_by(name: tfq)
      components = tag.components
      components.each do |component|
        matched_test_cases = component.test_cases.select do |test_case|
          test_case.tags.map(&:name).include? tfq
        end
        matched_bugs = component.bugs.select do |bug|
          bug.tags.map(&:name).include? tfq
        end

        if @result[component]
          @result[component][:test_cases] << matched_test_cases
          @result[component][:bugs] << matched_bugs
        else
          @result[component] = {
            test_cases: matched_test_cases,
            bugs: matched_bugs
          }
        end
      end
    end
    render :index
  end
end
