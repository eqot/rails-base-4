namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_ideas
    make_rating_ideas
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

def make_ideas
  user = User.first

  Idea.all.delete_all

  100.times do
    Idea.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      owner_id: user.id
    )
  end

  Idea.create!(
    title: "Test",
    description: "## Test\r\n\r\nThis is a test. :smile:\r\n\r\n```js\r\n    var foo = 0;\r\n    for (var i = 0; i < 10; i++) {\r\n        console.log(i);\r\n    }\r\n    return;\r\n```\r\n\r\n* a\r\n* b\r\n  * b-1\r\n  * b-2\r\n* c\r\n\r\nThis is a test.\r\nThis is also a test.\r\n\r\nWhat is this?\r\n\r\n![google](https://www.google.com/images/srpr/logo11w.png)\r\n",
    owner_id: user.id
  )

  users = User.all[0..3]
  ideas = Idea.all
  like_ideas = ideas[95..-1]
  users.each do |user|
    like_ideas.each do |like_idea|
      user.like!(like_idea)
    end
  end
end

def make_rating_ideas
  RatingIdea.all.delete_all

  users = User.all[0..3]
  ideas = Idea.all[97..-1]

  users.each do |user|
    ideas.each do |idea|
      idea.rate!(user, :impact, rand(5) + 1)
      idea.rate!(user, :frequency, rand(5) + 1)
    end
  end
end

def make_relationships
  Relationship.all.delete_all

  ideas = Idea.all

  relating_ideas = ideas[0..3]
  related_ideas = ideas[5..8]

  relating_ideas.each do |relating_idea|
    related_ideas.each do |related_idea|
      related_idea.relate!(relating_idea)
    end
  end
end
