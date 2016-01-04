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

end
