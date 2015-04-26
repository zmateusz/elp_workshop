# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Question.all.map {|x| x.destroy!}
# Answer.all.map {|x| x.destroy!}
Question.destroy_all
Answer.destroy_all
User.destroy_all

10.times do |n|
  user = User.new(email: "mail#{n}@example.com", password: '123123123')
  user.skip_confirmation!
  user.save
  Question.create(title: "Title #{n}", 
                  content: "I would ask if #{n} is good number?",
                  user_id: user.id)
end 

user_id = User.pluck(:id)
Question.all.each do |question|
  3.times do |x|
    Answer.create(content: "this is my answer #{x+1}", 
                  user_id: user_id.sample,
                  question: question)
  end
end