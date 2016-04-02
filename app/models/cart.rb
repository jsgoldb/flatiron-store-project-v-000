class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    items.map{|item| item.price.to_f}.sum
  end

  def add_item(item_id)
    LineItem.find_or_initialize_by(item_id: item_id, cart_id: self.id)
  end 


end
