# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require File.join(Rails.root,'spec','factories.rb')

DataMapper.auto_migrate!

# @admin = FactoryGirl.create(:user)
@other = FactoryGirl.create(:user)
@admin = FactoryGirl.create(:user, :email => "admin@greenback.com", :role => "admin")
