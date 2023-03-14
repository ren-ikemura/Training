# 継承

class PricedObject
  def total_price
    price * Tax.rate
  end

  def price
    raise NotImprementedError
  end
end

class Product < PricedObject
  attr_accessor :price
end

class OrderedItem < Product
  attr_accessor :unit_price, :volume

  def price
    unit_price * volume
  end
end

item = OrderedItem.new
