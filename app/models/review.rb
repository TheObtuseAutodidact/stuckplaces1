class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :place
  validates :content, presence: true

end
