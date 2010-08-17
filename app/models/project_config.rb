class ProjectConfig < ActiveRecord::Base

  validates_presence_of :url,:name,:database,:settings
  validates_uniqueness_of :name

end
