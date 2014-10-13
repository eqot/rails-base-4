class Relationship < ActiveRecord::Base

  belongs_to :relating, class_name: "Problem"
  belongs_to :related, class_name: "Problem"

end
