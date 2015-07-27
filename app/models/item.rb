class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :cost, presence: true
  has_many :bids
  belongs_to :user
end
