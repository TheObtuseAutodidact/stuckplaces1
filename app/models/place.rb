class Place < ActiveRecord::Base

  validates :name, presence: true
  validates :phone, presence: true
  validates :website, presence: true
  validates :user_id, presence: true
  validates :address, presence: true

  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  has_many :reviews, dependent: :destroy

  def average_rating
    self.reviews.sum(:score) / reviews.size
  rescue ZeroDivisionError
    0
  end

  def self.search(search)
    if search
      where(['name LIKE ? OR address LIKE ?', "#{search}", "#{search}"])
    else
      all
    end
  end
end
