class User < ActiveRecord::Base

  has_many :submitted_ideas, class_name: 'Idea', foreign_key: :owner_id

  has_many :like_ideas
  has_many :ideas, through: :like_ideas

  has_many :rating_ideas
  has_many :rated_ideas, through: :rating_ideas

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :name, presence: true
  validates :image_url, presence: true

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]

    case provider
    when 'google'
      name = auth_hash[:info][:name]
      image_url = auth_hash[:info][:image]
    when 'github'
      name = auth_hash[:info][:nickname]
      image_url = auth_hash[:info][:image]
    when 'twitter'
      name = auth_hash[:info][:nickname]
      image_url = auth_hash[:info][:image]
    end

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.image_url = image_url
    end
  end

  def like!(idea)
    like_ideas.create!(idea_id: idea.id)
  end

  def unlike!(idea)
    like_ideas.find_by(idea_id: idea.id).destroy
  end

end
