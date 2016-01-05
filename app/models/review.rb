class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :place
  
  validates :content, presence: true
  validates :score, presence: true

end
