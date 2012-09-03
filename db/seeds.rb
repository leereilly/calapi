# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'dbf'

widgets = DBF::Table.new("data/api11bdb.dbf")

County.delete_all
District.delete_all
School.delete_all

widgets.each do |record|
  county    = record['CNAME']
  district  = record['DNAME']

  # Counties
  unless County.find_by_name county
    puts "Creating county: #{county}"
    County.create(name: county)
  end

  # Districts
  unless District.find_by_name district
    puts "Creating district: #{district}"
    District.create(county_id: County.find_by_name(county).id, name: record['DNAME'])
  end

  # School
  unless School.find_by_name district
    puts "Creating district: #{district}"
    District.create(county_id: County.find_by_name(county).id, name: record['DNAME'])
  end
end
