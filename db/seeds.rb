# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

user = FactoryGirl.build(:user, email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
user.confirmed_at = Time.now
user.save!

3.times do |num|
  user = FactoryGirl.create(:user, email: "test#{num + 1}@test.com",
                            password: "12341234",
                            password_confirmation: "12341234")
  4.times do
    todo = FactoryGirl.build(:todo, user: user)
    todo.description = user.email + todo.description
    todo.save!
  end
end
