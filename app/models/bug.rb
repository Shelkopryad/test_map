class Bug < ApplicationRecord

  include ApplicationHelper

  belongs_to :component
  has_and_belongs_to_many :tags

  def key
    jira_link.gsub(/.*\//, '')
  end
end
