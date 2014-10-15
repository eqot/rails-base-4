class User < ActiveRecord::Base

  has_many :submitted_problems, class_name: 'Problem', foreign_key: :owner_id

  has_many :like_problems
  has_many :problems, through: :like_problems

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

  def like!(problem)
    like_problems.create!(problem_id: problem.id)
  end

  def unlike!(problem)
    like_problems.find_by(problem_id: problem.id).destroy
  end

end
