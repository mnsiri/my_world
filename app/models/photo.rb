class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_one    :itinerary,
             :dependent => :nullify

  belongs_to :user

  # Indirect associations

  # Validations

  validates :image, :presence => true

  validates :user_id, :presence => true

end
