class Problem < ActiveRecord::Base

  belongs_to :owner, class_name: 'User'
  delegate :name, :image_url, to: :owner, prefix: true

  validates :title, presence: true
  validates :owner_id, presence: true

  def submitted_by?(user)
    return false unless user
    owner_id == user.id
  end

end
