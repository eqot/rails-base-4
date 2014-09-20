class Problem < ActiveRecord::Base

  belongs_to :owner, class_name: 'User'

  validates :title, presence: true

  def submitted_by?(user)
    return false unless user
    owner_id == user.id
  end

end
