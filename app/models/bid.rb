class Bid < ActiveRecord::Base
  validates :ammount, presence: true
  belongs_to :user
  belongs_to :item
end
