class Relationship < ActiveRecord::Base

  belongs_to :relating, class_name: "Idea"
  belongs_to :related, class_name: "Idea"

end
