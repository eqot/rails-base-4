namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_problems
    make_rating_problems
    make_relationships
  end
end

def make_users
  User.all[1..-1].each { |u| u.delete }

  3.times do
    User.create!(
      provider: "google",
      uid: Faker::Number.number(8),
      name: Faker::Name.name,
      image_url: "https://lh5.googleusercontent.com/-XrwSVHny61A/AAAAAAAAAAI/AAAAAAAAIsI/Kgq5NrdjC1I/photo.jpg?sz=50"
    )
  end
end

def make_problems
  user = User.first

  Problem.all.delete_all

  Problem.create!(
    title: "Test",
    description: "## Test\r\n\r\nThis is a test. :smile:\r\n\r\n```js\r\n    var foo = 0;\r\n    for (var i = 0; i < 10; i++) {\r\n        console.log(i);\r\n    }\r\n    return;\r\n```\r\n\r\n* a\r\n* b\r\n  * b-1\r\n  * b-2\r\n* c\r\n\r\nThis is a test.\r\nThis is also a test.\r\n\r\nWhat is this?\r\n\r\n![google](https://www.google.com/images/srpr/logo11w.png)\r\n",
    owner_id: user.id
  )

  100.times do
    Problem.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      owner_id: user.id
    )
  end

  problems = Problem.all
  like_problems = problems[0..4]
  like_problems.each do |like_problem|
    user.like!(like_problem)
  end
end

def make_rating_problems
  RatingProblem.all.delete_all

  users = User.all[0..3]
  problems = Problem.all[0..3]

  users.each do |user|
    problems.each do |problem|
      problem.rate!(user, :impact, rand(5) + 1)
      problem.rate!(user, :frequency, rand(5) + 1)
    end
  end
end

def make_relationships
  Relationship.all.delete_all

  problems = Problem.all

  relating_problems = problems[0..3]
  related_problems = problems[5..8]

  relating_problems.each do |relating_problem|
    related_problems.each do |related_problem|
      related_problem.relate!(relating_problem)
    end
  end
end
