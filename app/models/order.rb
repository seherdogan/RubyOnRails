class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  
  validates :status, inclusion: { in: %w[pending confirmed shipped delivered cancelled] }
  
  before_save :calculate_total_price
  
  private
  
  def calculate_total_price
    self.total_price = order_items.sum(&:subtotal)
  end
end