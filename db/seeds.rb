# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do
  school = School.create(name: Faker::Company.name, motto: Faker::Company.bs)
  rand(1..8).times do
    course = school.courses.build(name: "#{Faker::Company.profession} Bootcamp", description: Faker::Company.catch_phrase)
    course.save
  end
  courses = school.courses.count
  rand(1*courses..2*courses).times do
    teacher = school.teachers.build(name: Faker::Name.name)
    rand(1..3).times do
      teacher.courses << school.courses.sample
    end
    teacher.save
  end

  rand(4*courses..6*courses).times do
    student = school.students.build(name: Faker::Name.name)
    rand(2..4).times do
      student.courses << school.courses.sample
    end
    student.save
  end
end
