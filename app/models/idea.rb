class Idea < ActiveRecord::Base

  has_many :relationships, foreign_key: "relating_id"
  has_many :related_ideas, through: :relationships, source: :related

  has_many :reverse_relationships, foreign_key: "related_id", class_name: "Relationship"
  has_many :relating_ideas, through: :reverse_relationships, source: :relating

  belongs_to :owner, class_name: 'User'
  delegate :name, :image_url, to: :owner, prefix: true

  has_many :like_ideas
  has_many :liked_users, through: :like_ideas, source: :user

  has_many :rating_ideas
  has_many :rated_users, through: :rating_ideas, source: :user

  mount_uploader :file, FileUploader

  include RankedModel
  ranks :row_order

  validates :title, presence: true
  validates :owner_id, presence: true

  def self.types
    %w(Problem)
  end

  def to_partial_path
    'ideas/idea'
  end

  def submitted_by?(user)
    return false unless user
    owner_id == user.id
  end

  def relating?(another_idea)
    relationships.find_by(related_id: another_idea.id)
  end

  def relate!(another_idea)
    relationships.create!(related_id: another_idea.id)
  end

  def unrelate!(another_idea)
    relationships.find_by(related_id: another_idea.id).destroy
  end

  def rating?(user)
    rating = rating_ideas.find_by(user_id: user.id)
  end

  def rate!(user, key, value)
    rating = rating_ideas.find_or_create_by!(user_id: user.id)

    case key
    when :impact
      rating.impact = value
    when :frequency
      rating.frequency = value
    end

    rating.save!
  end

end
