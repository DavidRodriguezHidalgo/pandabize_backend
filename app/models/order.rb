class Order < ApplicationRecord
  before_save :calculate_amount
  serialize :items, coder: JSON

  validates_presence_of [:items]
  validate :validate_items_row

  private

  def calculate_amount
      amountAux = 0
      items.each do |item|
          item = item.symbolize_keys
          product = Brand.find item[:product_id]
          amountAux += item[:quantity] * product.price
      end
      self.amount = amountAux
  end

  def validate_items_row
    OrderValidator.new.validate(items: items, errors: errors)
  end
end
