class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
  has_many :items
  has_many :bids

  def bidded_items(all_bids)
    item_id_arr = []
    all_bids.map{|b| item_id_arr << b.item_id}
    item_id_arr.delete(nil)
    @bid_items = []
    item_id_arr.uniq.each do |id|
      @bid_items << Item.find(id)
    end
    return @bid_items
  end

  def won_items(bidded_items)
    won_items = []
    bidded_items.each do |item|
      if Date::today.strftime("%Y-%m-%d") > item.end_date.to_s
        won_items << item
      end
    end
    won_items
  end

end
