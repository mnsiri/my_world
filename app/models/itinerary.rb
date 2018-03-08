class Itinerary < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :counter_cache => true

  has_many   :comments,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  belongs_to :photo,
             :required => false

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_many   :users,
             :through => :likes,
             :source => :user

  # Validations

end
