class Club < ActiveRecord::Base
  has_many :albums
  
  validates :picture, presence: true 
  validates :name, presence: true, length: { maximum: 7 }
  validates :category, presence: true
  validates :intro, presence: true
  validates :location, presence: true
  validates :history, presence: true
  validates :personnel, presence: true
  validates :phone, presence: true

  mount_uploader :picture, PictureUploader
end
