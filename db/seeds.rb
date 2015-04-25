# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.all.map {|x| x.destroy!}
Answer.all.map {|x| x.destroy!}

10.times do |n|
  question = Question.create(title: "Title #{n}", content: "I would ask if #{n} is good number?")
  5.times do |x|
    question.answers.create(content: "this is my answer #{n+1}")
  end
end 

