class CalculatePrice
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def total
    price_for_mugs + price_for_tshirts + price_for_others
  end

  def validate
    items.map do |item|
      return false if Product.find_by(code: item).nil?
    end
  end

  protected

  def price_for_mugs
    data = items.grep('MUG')
    return 0 if data.blank?

    data.pop if data.size > 1
    sum_items(data)
  end

  def price_for_tshirts
    data = items.grep('TSHIRT')
    return 0 if data.blank?

    total = sum_items(data)
    total -= percentage(30, total) if data.size >= 3
    total
  end

  def price_for_others
    data = items - ['MUG', 'TSHIRT']
    return 0 if data.blank?

    sum_items(data)
  end

  def sum_items(items)
    items.map do |item|
      Product.find_by(code: item).price
    end.reduce(:+)
  end

  def percentage(percent, total)
    (total * percent).to_f / 100
  end
end
