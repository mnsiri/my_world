class Itinerary < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  belongs_to :photo

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
