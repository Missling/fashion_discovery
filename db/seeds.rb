# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

60.times do 
  random_thumbnail = ["https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSPyls7et4SxhJ4S12TDJpPo7Me0Fk5hFunNxt7rZDPmtNOmNYK", 
    "http://cdn-images.farfetch.com/11/10/33/72/11103372_5320187_300.jpg", 
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQtkEv0LwU1dxFyQQV87L8MSoNcRKBCkB8zUZ_ySgVIH2by1J73"].shuffle.first

  Content.create(title: Faker::Lorem.sentence, blurb: Faker::Lorem.paragraph, author: Faker::Name.name, thumbnail_url: random_thumbnail, details_url: Faker::Internet.url)
end
