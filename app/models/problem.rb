class Problem < ActiveRecord::Base

  has_many :relationships, foreign_key: "relating_id"
  has_many :reverse_relationships, foreign_key: "related_id", class_name: "Relationship"
  has_many :relating_problems, through: :relationships, source: :relating
  has_many :related_problems, through: :reverse_relationships, source: :related

  belongs_to :owner, class_name: 'User'
  delegate :name, :image_url, to: :owner, prefix: true

  validates :title, presence: true
  validates :owner_id, presence: true

  def submitted_by?(user)
    return false unless user
    owner_id == user.id
  end

  def relating?(another_problem)
    relationships.find_by(related_id: another_problem.id)
  end

  def relate!(another_problem)
    relationships.create!(related_id: another_problem.id)
  end

  def unrelate!(another_problem)
    relationships.find_by(related_id: another_problem.id).destroy
  end

end
