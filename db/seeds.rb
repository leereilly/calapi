# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'dbf'

widgets = DBF::Table.new("data/api11bdb.dbf")


widgets.each do |record|
  unless County.find_by_name(record['CNAME'])
    puts "Creating county: #{record['CNAME']}"
    County.create(name: record['CNAME'])
  end
end
