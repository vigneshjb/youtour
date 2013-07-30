require 'faker'
namespace :db do
  desc "Fill database with sample data" 
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_tours
    make_trips
  end
end

def make_users
  User.create!(:username => "sample@youtour.com", :password => "test",
                        :password_confirmation => "test")
  99.times do
    email = Faker::Internet.email
    name = Faker::Name.name
    password = "abcd"
    User.create!(:username => email,
                     :password => password,
                     :password_confirmation => password,
                     :name => name)
  end 
end

def make_tours
  User.all(:limit => 10).each do |user| 
    10.times do |n|
      user_id = user.id
      from = Faker::Address.city
      to = Faker::Address.city
      des = Faker::Lorem.sentence(6)
      date = Faker::Base.regexify('/^(20[0-9]{2})-([1-9]{1}|1[0-2]{1})-([1-9]{1}|[1-2]{1}[0-9]{1})$/')
      user.tours.create!(:user_id => user.id, :from_loc => from, :to_loc => to, :doj => date, :desp => des)
    end
  end
end

def make_trips
  Tour.all(:limit => 50).each do |tour|
    10.times do |n|
      num = Faker::Base.regexify('/^([1-9]{1}|[1-9]{1}[0-9]{1}|100)$/')
      p "from here"
      p num
      if num == tour.user_id
        num=num+1
      end
      stat = Faker::Base.regexify('/^[0-1]{1}$/')
      tour.trips.create!(:tour_id => tour.id, :request_by => num, :status => stat)
    end
  end
end