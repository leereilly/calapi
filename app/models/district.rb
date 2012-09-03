class District < ActiveRecord::Base
  attr_accessible :county_id, :id, :name

  validates_uniqueness_of :name
end
